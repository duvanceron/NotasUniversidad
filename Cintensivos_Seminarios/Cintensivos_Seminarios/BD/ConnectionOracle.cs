using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using Oracle.ManagedDataAccess.Client;

namespace Cintensivos_Seminarios.BD
{

	public class ConnectionOracle
	{
		private static string stringConnection = ConfigurationManager.ConnectionStrings["OracleConexion"].ConnectionString;
		OracleConnection Conn = new OracleConnection(stringConnection);





		/**
             <summary>Abre la conexión con la base de datos Oracle</summary>
             */

		public OracleConnection ConexionOracle()
		{
			try
			{
				if (Conn.State == ConnectionState.Closed)
				{
					Conn.Open();
				}

			}
			catch (Exception ex)
			{
				throw new Exception("No se realizó la conexión a la base de datos: " + ex.Message);
			}
			return Conn;
		}

		/**
         * <summary>Ejecuta un procedimiento almacenado de consulta</summary>
         * <param name="Procedure">Nombre del procedimiento</param>
         * <param name="Cursor">Nombre cursor</param>
         * <param name="Parameters">Parametros</param>
         */
		public DataTable realizarConsulta(string Procedure, string Cursor, Parametro[] Parameters)
		{
			DataTable data = new DataTable();
			OracleConnection conn = new OracleConnection();
			conn = ConexionOracle();
			OracleCommand cmd = new OracleCommand();
			cmd.Connection = conn;
			cmd.CommandText = Procedure;
			cmd.CommandType = CommandType.StoredProcedure;

			cmd.Parameters.Add(Cursor, OracleDbType.RefCursor).Direction = ParameterDirection.Output;

			if (Parameters != null)
			{
				for (int i = 0; i < Parameters.Length; i++)
				{
					cmd.Parameters.Add(Parameters[i].Nombre, Parameters[i].Value).Direction = ParameterDirection.Input;
				}
			}

			try
			{
				OracleDataAdapter da = new OracleDataAdapter(cmd);
				da.Fill(data);
				return data;
			}
			catch (Exception e)
			{
				throw new Exception("Sentencia de consulta invalida " + e.Message);
			}
		}

		public bool realizarTransaccion(Transaction[] list)
		{
			bool state = false;
			OracleConnection conn = new OracleConnection();
			OracleCommand cmd = null;
			conn = ConexionOracle();

			OracleTransaction Transa = conn.BeginTransaction();

			try
			{
				for (int i = 0; i < list.Length; i++)
				{
					if (list[i] == null) continue;

					cmd = new OracleCommand(list[i].Procedure, conn);
					cmd.CommandType = CommandType.StoredProcedure;
					foreach (Parametro obj in list[i].Parameters)
					{
						if (obj != null)
						{
							cmd.Parameters.Add(obj.Nombre, obj.Value);
						}
					}
					cmd.Transaction = Transa;
					cmd.ExecuteNonQuery();
				}
				Transa.Commit();
				// conn.Close();
				// conn.Dispose();
				Transa.Dispose();
				state = true;
			}
			catch
			{
				Transa.Rollback();
				// conn.Close();
				// conn.Dispose();
				state = false;
			}
			finally
			{
				if (cmd != null)
				{
					cmd.Dispose();
				}
			}
			return state;
		}


		public DataTable OraProcedimiento(string procedimiento, Parametro[] parametros)
		// OraProcedimiento: procesar procedimientos con funciones y retorna DataTable
		{
			OracleConnection connection = new OracleConnection(); //Instanciación conexión

			connection = ConexionOracle();                                                    //Apertura de conexión      
			OracleCommand comando = new OracleCommand(procedimiento, connection)
			{
				CommandType = CommandType.StoredProcedure                    //Asignación del tipo de comando
			}; //Instanciación del comando

			DataTable datos = new DataTable();                                    //DataTable para alamacenar resultado
																				  //OracleDataReader dataReader;                                          //Oracle Data Reader para 

			foreach (Parametro p in parametros)
			{
				comando.Parameters.Add(new OracleParameter(p.Nombre, p.Tipo)); //Adicionar Parametro
				comando.Parameters[p.Nombre].Direction = p.Direccion;             //Establece la dirección del parametro INPUT para parametros de entraday OUTPUT para parametros de salida
				if (p.Direccion == ParameterDirection.Input)
					comando.Parameters[p.Nombre].Value = p.Valor;                 //Valor para los parametros de entrada
			}
			try
			{

				datos.Load(comando.ExecuteReader());                              //Captura en el DataTable del resultado del procedimiento/función

				if (datos.Columns[0].ColumnName.Equals("_TIPO"))
				{
					datos.TableName = "_notificacion";
					return datos;
				}
				else
					return datos;                                                   //Retorna el DataTable Capturado

			}
			catch (Exception ex)
			{
				datos.Columns.Clear();
				datos.Columns.Add("_ERROR");
				datos.Columns.Add("_MENSAJE");
				datos.Rows.Add("Error", ex.Message);
				string aa = ex.Message;
				throw new Exception("Sentencia de consulta invalida " + ex.Message);
			
			}
			finally
			{
				if (connection != null)
					if (connection.State == ConnectionState.Open)
						connection.Close();
			}
		}

		public DataTable realizarConsultaFuncion(string Procedure, string Cursor, Parametro[] Parameters)
		{
			DataTable data = new DataTable();
			OracleConnection conn = new OracleConnection();
			conn = ConexionOracle();
			OracleCommand cmd = new OracleCommand();
			cmd.Connection = conn;
			cmd.CommandText = Procedure;
			cmd.CommandType = CommandType.StoredProcedure;

			cmd.Parameters.Add(Cursor, OracleDbType.RefCursor).Direction = ParameterDirection.Output;

			if (Parameters != null)
			{
				for (int i = 0; i < Parameters.Length; i++)
				{
					cmd.Parameters.Add(Parameters[i].Nombre, Parameters[i].Value).Direction = ParameterDirection.Input;
				}
			}

			try
			{
				OracleDataAdapter da = new OracleDataAdapter(cmd);
				da.Fill(data);
				return data;
			}
			catch (Exception e)
			{
				throw new Exception("Sentencia de consulta invalida " + e.Message);
			}
		}

	}
}