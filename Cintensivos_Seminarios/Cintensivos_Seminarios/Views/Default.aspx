<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cintensivos_Seminarios.Views.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Simple Array Grid - Ext.NET Examples</title>


	<script>
		var template = '<span style="color:{0};">{1}</span>';

		var change = function (value) {
			return Ext.String.format(template, (value > 0) ? "green" : "red", value);
		};

		var pctChange = function (value) {
			return Ext.String.format(template, (value > 0) ? "green" : "red", value + "%");
		};
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<ext:ResourceManager runat="server" />

		

		<ext:panel
			id="ventana"
			runat="server"
			Region="West"
			Title="Example"
			Closable="true"
			Layout="FitLayout"
			Height="350"
			Width="620">
			<TopBar>
				<ext:Toolbar runat="server">
					<Items>
						<ext:Button
							runat="server"
							Text="Reconfigure"
							Icon="Accept">
							<DirectEvents>
								<Click OnEvent="Button1_Click">
									<EventMask
										ShowMask="true"
										Target="CustomTarget"
/>
								</Click>
							</DirectEvents>
						</ext:Button>
					</Items>
				</ext:Toolbar>
			</TopBar>
			<Items>
				<ext:GridPanel
					ID="GridPanel1"
					runat="server"
					Border="false">
					<Store>
						<ext:Store ID="Store1" runat="server">
							<Model>
								<ext:Model runat="server">
									<Fields>
										<ext:ModelField Name="company" />
										<ext:ModelField Name="price" Type="Float" />
										<ext:ModelField Name="change" Type="Float" />
										<ext:ModelField Name="pctChange" Type="Float" />
										<ext:ModelField Name="lastChange" Type="Date" DateFormat="M/d hh:mmtt" />
									</Fields>
								</ext:Model>
							</Model>
						</ext:Store>
					</Store>
					<ColumnModel runat="server">
						<Columns>
							<ext:Column runat="server" Text="Company" DataIndex="company" Flex="1" />
							<ext:Column runat="server" Text="Price" DataIndex="price">
								<Renderer Format="UsMoney" />
							</ext:Column>
							<ext:Column runat="server" Text="Change" DataIndex="change">
								<Renderer Fn="change" />
							</ext:Column>
							<ext:Column runat="server" Text="Change" DataIndex="pctChange">
								<Renderer Fn="pctChange" />
							</ext:Column>
							<ext:DateColumn runat="server" Text="Last Updated" DataIndex="lastChange" />
						</Columns>
					</ColumnModel>
					<View>
						<ext:GridView runat="server" StripeRows="true" TrackOver="true" />
					</View>
				</ext:GridPanel>
			</Items>
		</ext:panel>
	</form>
</body>
</html>
