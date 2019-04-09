﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarNotasDocente.aspx.cs" Inherits="Cintensivos_Seminarios.Views.SeminariosDocente" %>

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

		var change = function (value) {
			return Ext.String.format(template, (value >= 3) ? "green" : "red", value);
		};

		function insertRecord(grid) {
			var store = grid.store,
				row = store.lastOf(store.insert(0, {
					DESCRIPCION: Ext.getCmp('txtDescription').getValue()+" ("+ Ext.getCmp('txtWeight').getValue()+"%)",
					NOTA_PORCENTAJE: Ext.getCmp('txtWeight').getValue()
				}, {})[0]);

		};



		var edit = function (editor, e) {
            /*
                "e"   es un evento para editar con las siguientes properties.

                    grid - EL grid
                    record - El nombre del campo que fue editado
                    field - El nombre del campo que fue editado 
                    value - el valor que se colocara. 
                    originalValue - el valor original antes de ser editado.
                    row - fila de la tabla del gridpanel
                    column - The grid Column defining the column that was edited.
                    rowIdx - The row index that was edited
                    colIdx - The column index that was edited
            */

			// Llamar DirectMethod
			if (!(e.value === e.originalValue || (Ext.isDate(e.value) && Ext.Date.isEqual(e.value, e.originalValue)))) {
				notasDocente.Edit(e.record.data.PREM_ID, e.field, e.originalValue, e.value, e.record.data);
				StoreStudents.load();
			}
		};

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
											<EventMask ShowMask="true" Target="CustomTarget" CustomTarget="#{GridStudents}" />
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
							Collapsible="true">

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
									<ext:Column runat="server" Text="DEFINITIVA" DataIndex="DEFINITIVA" Flex="1" i />
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
				<ext:Panel
					ID="pnlAddPeso"
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
								<ext:TextField ID="txtWeight" runat="server" FieldLabel="Peso de la nota" Name="Title" MarginSpec="0 0 0 5" />
							</Items>
						</ext:FieldContainer>

					</Items>


					<Buttons>

						<ext:Button ID="btnAdd" runat="server" Text="Agregar" Icon="TableAdd">
							<Listeners>
								<Click Handler="insertRecord(#{gridPesos});" />
							</Listeners>
						</ext:Button>

						<ext:Button ID="Button2" runat="server" Text="Modificar" Icon="TableEdit">
							<Listeners>
							</Listeners>
						</ext:Button>
						<ext:Button ID="btnDelete" runat="server" Text="Eliminar" Icon="TableDelete">
							<Listeners>
								<Click Handler="#{gridPesos}.deleteSelected();" />
							</Listeners>
						</ext:Button>
						<ext:Button ID="Button4" runat="server" Text="Limpiar" Icon="Table">
							<Listeners>
							</Listeners>
						</ext:Button>


					</Buttons>

				</ext:Panel>
				<ext:Panel
					ID="pnlPesosAcademicos"
					Icon="Note"
					runat="server"
					Region="South"
					Title="Pesos registrados"
					Frame="true"
					Layout="HBoxLayout">

					<Items>
						<ext:GridPanel
							AutoScroll="true"
							ID="gridPesos"
							Flex="3"
							runat="server">
							<Store>
								<ext:Store ID="stPesos" runat="server">
									<Model>
										<ext:Model runat="server">
											<Fields>
												<ext:ModelField Name="NOTA_ID" />
												<ext:ModelField Name="DESCRIPCION" />
												<ext:ModelField Name="NOTA_PORCENTAJE" />
												<ext:ModelField Name="SISE_NOMBRE" />

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

				<ext:Button ID="btnSave" runat="server" Text="Save" Icon="Disk">
					<Listeners>
					</Listeners>
				</ext:Button>

				<ext:Button ID="btnCancel" runat="server" Text="Cancel" Icon="Cancel">
					<Listeners>
					</Listeners>
				</ext:Button>


			</Buttons>
		</ext:Window>

	</form>
</body>
</html>
