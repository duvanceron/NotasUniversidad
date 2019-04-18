<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarNotasDocente.aspx.cs" Inherits="Cintensivos_Seminarios.Views.SeminariosDocente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>RegistrarNotas</title>
	<style>
		.ocultarcampo {
			display: none;
		}
	</style>

	<script>
		var template = '<span style="color:{0};">{1}</span>';
		var jsonPesos = [];
		var change = function (value) {
			return Ext.String.format(template, (value >= 3) ? "green" : "red", value);
		}

		function insertRow(grid) {
			if (!isFieldEmpty(App.txtWeight.value) && !isFieldEmpty(App.txtDescription.value) &&
				isPositive(App.txtWeight.value) && !isFieldEmpty(App.cmbxSistemaEvaluacion.value) && !isNaN(App.txtWeight.value)) {

				verifyData(grid);

			} else {
				showMsgError2("Los datos ingresados no son correctos");


			}
		}

		function verifyData(grid) {
			var jsonNotasPeso = JSON.parse(Ext.encode(App.gridPesos.getRowsValues()));
			var porcentajeNotas = 0;
			for (var i in jsonNotasPeso) {
				if (jsonNotasPeso[i].SISE_NOMBRE == App.cmbxSistemaEvaluacion.selection.data.SISE_NOMBRE) {

					porcentajeNotas += parseInt(jsonNotasPeso[i].NOTA_PORCENTAJE);
				}


			}
			porcentajeNotas = porcentajeNotas + parseInt(App.txtWeight.value);

			if (App.cmbxSistemaEvaluacion.selection.data.SISE_NOMBRE == "PARCIAL 70%") {
				if (porcentajeNotas <= 70) {
					insertRecord(grid);
				} else {

					showMsgError2("Peso de la nota incorrecto.");
				}


			}
			else if (App.cmbxSistemaEvaluacion.selection.data.SISE_NOMBRE == "PARCIAL 30%") {
				if (porcentajeNotas <= 30) {
					insertRecord(grid);
				} else {
					showMsgError2("Peso de la nota incorrecto.");
				}
			}


		}

		function insertRecord(grid) {
			var store = grid.store,
				row = store.indexOf(store.insert(0, {
					NOTA_ID: -1,
					DESCRIPCION: Ext.getCmp('txtDescription').getValue() + " (" + Ext.getCmp('txtWeight').getValue() + "%)",
					NOTA_PORCENTAJE: Math.round(parseInt(Ext.getCmp('txtWeight').getValue())),
					SISE_NOMBRE: App.cmbxSistemaEvaluacion.selection.data.SISE_NOMBRE,
					SISE_ID: App.cmbxSistemaEvaluacion.selection.data.SISE_ID
				}, {})[0]);

			cleanRecords();
		}

		var edit = function (editor, e) {
            /*
                "e"   es un evento para editar con las siguientes properties.

                    grid - EL grid
                    record - El nombre del campo que fue editad
                    field - El nombre del campo que fue editado 
                    value - el valor que se colocara. 
                    originalValue - el valor original antes de ser editado.
         
            */

			// Llamar DirectMethod

			//e.value = e.value.replace(",", ".");
			if (!(e.value === e.originalValue || (Ext.isDate(e.value) && Ext.Date.isEqual(e.value, e.originalValue)))) {
				notasDocente.Edit(e.record.data.PREM_ID, e.field, e.originalValue, e.value, e.record.data,App.GridAssignedGroups.selection.data.CODIGO);

			}
		}

		saveChanges = function () {
			notasDocente.ModifyNotesGroup(Ext.encode(App.gridPesos.getRowsValues()), Ext.encode(jsonPesos));
			jsonPesos = [];
		}
		function deleteRecords(grid) {
			if (App.gridPesos.selection != null) {
				jsonPesos.push(App.gridPesos.selection.data);
				grid.deleteSelected();

			}

		}




		function showMsgError(msg) {
			Ext.net.Notification.show({
				iconCls: '#Error',
				pinEvent: 'click',
				html: msg,
				title: 'Error'
			});
		}

		function showMsgError2(msg) {
			Ext.Msg.info({
				ui: 'warning',
				title: 'Error',
				html: msg,
				iconCls: '#Error'
			});
		}


		var cleanRecords = function () {
			App.pnlAddPesos.reset();

		}

		function isFieldEmpty(txtField) {
			if (txtField == "" || txtField == null) {
				return true;
			}
			return false;
		}

		function isPositive(number) {
			if (parseInt(number) >= 1) {
				return true;
			}
			return false;
		}

		function isNumber(number) {
			if (parseInt(number) >= 1) {
				return true;
			}
			return false;
		}





	</script>
</head>
<body>
	<form runat="server">
		<ext:ResourceManager runat="server" Theme="Default" />
		<ext:Viewport runat="server" Layout="BorderLayout">
			<Items>

				<%-- Panel Izquierdo --%>
				<ext:Panel
					ID="test"
					runat="server"
					Region="West"
					Collapsible="true"
					Collapsed="true"
					Width="250"
					MinWidth="250"
					Split="true"
					Title="Cursos ">
					<LayoutConfig>
						<ext:VBoxLayoutConfig Align="Stretch" />
					</LayoutConfig>
					<Items>
						<ext:GridPanel
							ID="GridCourses"
							runat="server"
							Title="Información básica"
							Icon="Group"
							AutoHeight="true"
							Flex="1"
							AutoScroll="true"
							Collapsible="true">
							<Store>
								<ext:Store ID="StoreCourses" runat="server">
									<Model>
										<ext:Model runat="server">
											<Fields>
												<ext:ModelField Name="CURS_ID" />
												<ext:ModelField Name="CURS_NOMBRE" />

											</Fields>
										</ext:Model>
									</Model>
								</ext:Store>
							</Store>
							<ColumnModel runat="server">
								<Columns>
									<ext:Column runat="server" Text="" CellWrap="true" DataIndex="CURS_ID" Visible="false" />
									<ext:Column runat="server" Text="" CellWrap="true" DataIndex="CURS_NOMBRE" Flex="2" />
								</Columns>
							</ColumnModel>
							<SelectionModel>
								<ext:RowSelectionModel runat="server" Mode="Single">
									<DirectEvents>
										<Select OnEvent="ConsultGroups" Buffer="250">
											<EventMask ShowMask="true" Target="CustomTarget" CustomTarget="#{GridAssignedGroups}" />
											<ExtraParams>

												<ext:Parameter Name="CURS_ID" Value="record.data.CURS_ID" Mode="Raw" />
											</ExtraParams>
										</Select>
									</DirectEvents>
								</ext:RowSelectionModel>
							</SelectionModel>
							<View>
								<ext:GridView runat="server" StripeRows="true" />
							</View>

						</ext:GridPanel>
					</Items>
				</ext:Panel>



				<%-- Panel Centro --%>
				<ext:Panel
					ID="windowGroups"
					runat="server"
					Region=" Center"
					Title="Registrar Notas"
					Frame="true"
					Layout="VBoxLayout">
					<LayoutConfig>
						<ext:VBoxLayoutConfig Align="Stretch" />
					</LayoutConfig>
					<Items>

						<ext:GridPanel
							ID="GridAssignedGroups"
							runat="server"
							Title="Grupos asignados"
							Icon="Group"
							AutoHeight="true"
							Flex="1"
							AutoScroll="true"
							Collapsible="true">
							<Store>
								<ext:Store ID="StoreGroups" runat="server" PageSize="10">
									<Model>
										<ext:Model runat="server">
											<Fields>
												<ext:ModelField Name="CODIGO" />
												<ext:ModelField Name="GRUP_NOMBRE" />
												<ext:ModelField Name="Periodó Académico" />

											</Fields>
										</ext:Model>
									</Model>
								</ext:Store>
							</Store>
							<ColumnModel ID="colummodelid" runat="server">
								<Columns>
									<ext:RowNumbererColumn runat="server" Width="35" />
									<ext:Column runat="server" Text="Codigo" DataIndex="CODIGO"></ext:Column>
									<ext:Column runat="server" Text="Nombre Grupo" CellWrap="true" DataIndex="GRUP_NOMBRE" Flex="2" />
									<ext:Column runat="server" Text="Periodó Académico" CellWrap="true" DataIndex="Periodó Académico" Flex="2" />
									<%-- Flex: 1=10% ocupa del contenedor, 2=20% ocupa del contenedor, etc... --%>
									<ext:CommandColumn ID="comandColumn1" runat="server" Width="160">
										<Commands>

											<ext:GridCommand Icon="FolderGo" CommandName="ConsultarPesos" Text="Gestionar pesos" />
										</Commands>
										<DirectEvents>
											<Command OnEvent="GestionarPesos">
												<ExtraParams>
													<ext:Parameter Name="command" Value="command" Mode="Raw"></ext:Parameter>
													<ext:Parameter Name="CODIGO" Value="record.data.CODIGO" Mode="Raw" />
													<ext:Parameter Name="GRUP_NOMBRE" Value="record.data.GRUP_NOMBRE" Mode="Raw" />
												</ExtraParams>
											</Command>
										</DirectEvents>

									</ext:CommandColumn>
								</Columns>
							</ColumnModel>
							<SelectionModel>
								<ext:RowSelectionModel runat="server" Mode="Single">
									<DirectEvents>
										<Select OnEvent="ConsultNote" Buffer="250">
											<EventMask ShowMask="true" Msg="Consultando..." />
											<ExtraParams>
												<ext:Parameter Name="CODIGO" Value="record.data.CODIGO" Mode="Raw" />
											</ExtraParams>
										</Select>
									</DirectEvents>
								</ext:RowSelectionModel>
							</SelectionModel>
							<View>
								<ext:GridView runat="server" StripeRows="true" />
							</View>

						</ext:GridPanel>




						<ext:GridPanel
							ID="GridStudents"
							runat="server"
							Title="Estudiantes Matriculadas"
							Icon="UserSuit"
							AutoHeight="true"
							AutoScroll="true"
							Flex="1"
							Collapsible="false">

							<Store>
								<ext:Store ID="StoreStudents" runat="server" PageSize="5">
									<Model>
										<ext:Model runat="server" IDProperty="ID">
											<Fields>
												<ext:ModelField Name="CODIGO" Type="String" />
												<ext:ModelField Name="ESTUDIANTE" />
												<ext:ModelField Name="NOTA 1" Type="Float" />
												<ext:ModelField Name="NOTA 2" Type="Float" />
												<ext:ModelField Name="DEFINITIVA" Type="Float" />
											</Fields>
										</ext:Model>
									</Model>
								</ext:Store>
							</Store>

							<ColumnModel runat="server">
								<Columns>
									<ext:RowNumbererColumn runat="server" Width="35" />
									<ext:Column runat="server" Text="Codigo" DataIndex="CODIGO" />
									<ext:Column runat="server" Text="Estudiante" DataIndex="ESTUDIANTE" Flex="1" />
									<ext:Column runat="server" Text="NOTA 1" DataIndex="NOTA 1" Flex="1" />
									<ext:Column runat="server" Text="NOTA 2" DataIndex="NOTA 2" Flex="1" />
									<ext:Column runat="server" Text="DEFINITIVA" DataIndex="DEFINITIVA" Flex="1" />
								</Columns>
							</ColumnModel>
							<Plugins>
								<ext:CellEditing runat="server">
									<Listeners>
										<Edit Fn="edit" />
									</Listeners>
								</ext:CellEditing>
							</Plugins>

							<SelectionModel>
								<ext:RowSelectionModel runat="server" Mode="Single" />
							</SelectionModel>
							<View>
								<ext:GridView runat="server" StripeRows="true" />
							</View>

							<Buttons>
								<ext:Button runat="server" Text="Refrescar" Icon="ArrowRefresh">
									<Listeners>
										<Click Handler="#{StoreStudents}.load();" />
									</Listeners>
								</ext:Button>
							</Buttons>
						</ext:GridPanel>

					</Items>

				</ext:Panel>


			</Items>
		</ext:Viewport>


		<ext:Window
			ID="winDetails"
			runat="server"
			Icon="Folder"
			Width="800"
			Height="300"
			Modal="true"
			Hidden="true">

			<Items>
				<ext:FormPanel
					ID="pnlAddPesos"
					runat="server"
					Layout="HBoxLayout"
					BodyPadding="5"
					Region="North"
					Frame="true">
					<Defaults>
						<ext:Parameter Name="margin" Value="0 5 0 0" Mode="Value" />
					</Defaults>
					<LayoutConfig>
						<ext:HBoxLayoutConfig Align="Middle" Pack="Center" />
					</LayoutConfig>
					<Items>
						<ext:FieldContainer
							runat="server"
							Layout="HBoxLayout">
							<FieldDefaults LabelAlign="Top" />
							<Items>
								<ext:ComboBox
									ID="cmbxSistemaEvaluacion"
									runat="server"
									FieldLabel="Sistema de evaluación"
									AllowBlank="true"
									DisplayField="SISE_NOMBRE"
									ValueField="SISE_ID"
									TypeAhead="true"
									QueryMode="Local"
									Name="cmbxSistemaEvaluacion"
									ForceSelection="true"
									TriggerAction="All"
									EmptyText=""
									Width="230"
									MarginSpec="0 0 0 5">
									<Store>
										<ext:Store ID="StSistemaEvaluacion" runat="server">
											<Model>
												<ext:Model runat="server" IDProperty="SISE_ID">
													<Fields>
														<ext:ModelField Name="SISE_ID" />
														<ext:ModelField Name="SISE_NOMBRE" />
													</Fields>
												</ext:Model>
											</Model>
										</ext:Store>
									</Store>
								</ext:ComboBox>
								<ext:TextField ID="txtDescription" runat="server" FieldLabel="Descripción de la nota" Name="Title" Flex="2" MarginSpec="0 0 0 5" Width="330" />
								<ext:TextField ID="txtWeight" runat="server" FieldLabel="Peso de la nota" Name="Title" MarginSpec="0 0 0 5"></ext:TextField>

							</Items>
						</ext:FieldContainer>

					</Items>


					<Buttons>

						<ext:Button ID="btnAdd" runat="server" Text="Agregar" Icon="TableAdd">
							<Listeners>
								<Click Handler="insertRow(#{gridPesos});" />
							</Listeners>
						</ext:Button>

						<ext:Button ID="Button2" runat="server" Text="Modificar" Icon="TableEdit">
							<Listeners>
							</Listeners>
						</ext:Button>
						<ext:Button ID="btnDelete" runat="server" Text="Eliminar" Icon="TableDelete">
							<Listeners>
								<Click Handler="deleteRecords(#{gridPesos});" />
							</Listeners>
						</ext:Button>
						<ext:Button ID="btnClear" runat="server" Text="Limpiar" Icon="Table">
							<Listeners>
								<Click Handler="cleanRecords();" />
							</Listeners>
						</ext:Button>


					</Buttons>

				</ext:FormPanel>
				<ext:Panel
					ID="pnlPesosAcademicos"
					Icon="Note"
					runat="server"
					Region="South"
					Title="Pesos registrados"
					Frame="true"
					Layout="FitLayout">

					<Items>
						<ext:GridPanel
							ID="gridPesos"
							runat="server"
							AutoScroll="true">
							<Store>
								<ext:Store ID="stPesos" runat="server">
									<Model>
										<ext:Model runat="server">
											<Fields>
												<ext:ModelField Name="NOTA_ID" />
												<ext:ModelField Name="DESCRIPCION" />
												<ext:ModelField Name="NOTA_PORCENTAJE" />
												<ext:ModelField Name="SISE_NOMBRE" />
												<ext:ModelField Name="SISE_ID" />

											</Fields>
										</ext:Model>
									</Model>

								</ext:Store>
							</Store>
							<ColumnModel runat="server">
								<Columns>
									<ext:Column runat="server" Text="Descripción" CellWrap="true" DataIndex="DESCRIPCION" Flex="2" />
									<ext:Column runat="server" Text="Peso" CellWrap="true" DataIndex="NOTA_PORCENTAJE">
										<Editor>
											<ext:TextField ID="TextFieldNota" runat="server" />
										</Editor>
									</ext:Column>
									<ext:Column runat="server" Text="Tipo de Evaluación" CellWrap="true" DataIndex="SISE_NOMBRE" Flex="1" />
									<ext:Column runat="server" Text="SISTEMA_ID" CellWrap="true" DataIndex="SISE_ID" Flex="1" Visible="false" />
								</Columns>
							</ColumnModel>

							<SelectionModel>
								<%--<ext:RowSelectionModel runat="server" Mode="Multi" />--%>
								<ext:RowSelectionModel runat="server" Mode="Single" />
							</SelectionModel>

							<View>
								<ext:GridView runat="server" StripeRows="true" />
							</View>

						</ext:GridPanel>


					</Items>
				</ext:Panel>
			</Items>
			<Buttons>

				<ext:Button ID="btnSave" runat="server" Text="Guardar" Icon="Disk">
					<Listeners>
						<Click Handler="saveChanges();" />
					</Listeners>
				</ext:Button>

				<ext:Button ID="btnCancel" runat="server" Text="Cancelar" Icon="Cancel">
					<Listeners>
					</Listeners>
				</ext:Button>


			</Buttons>
		</ext:Window>

	</form>
</body>
</html>
