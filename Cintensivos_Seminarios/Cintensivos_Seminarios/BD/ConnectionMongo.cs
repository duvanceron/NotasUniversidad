using System;
using System.IO;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.GridFS;


namespace Cintensivos_Seminarios.BD
{

	public class ConnectionMongo
	{
		IMongoDatabase database;
		Byte[] source;

		public ConnectionMongo()
		{
			var mgClient = new MongoClient("mongodb://localhost");
			database = mgClient.GetDatabase("ABDG2");
		}

		public object GetIdImage(String filename, String nombre)
		{
			source = File.ReadAllBytes(filename);
			//var collection = database.GetCollection<Mprograma>("doc_persona");
			var filename2 = filename;
			var options = new GridFSUploadOptions
			{
				ChunkSizeBytes = 64512, // 63KB
				Metadata = new BsonDocument
				{
					{ "resolution", "1080P" },
					{ "copyrighted", true },
					{ "nombre", nombre }
				}
			};
			var bucket = new GridFSBucket(database);
			var id = bucket.UploadFromBytes(filename, source, options);
			return id;
		}
	}

}