//Save all tiles to the map by their sprite name and index.

//Create out data structures.

instanceList = ds_list_create();

#region DoesThisEvenGetUsed
//The list that will store ALL devices.
var _deviceList = ds_list_create()
//A reused map that stores an individual device, to be added to the list.
var _deviceMap = noone;
ds_list_destroy(_deviceList);
#endregion


//Fill the 16x16 grid with the names of terrain sprites. They are properly converted to an asset index on the other side.
//We don't use the asset index here because we don't know if it will change between now and game runtime.
mChunkSaverFillTerrainGrid();
mChunkSaverProcessObjectsAsSpriteLayer(oChunkCreatorTerrainWall, CHUNK_FILE_KEYS_TERRAIN_WALLS);
mChunkSaverProcessObjectsAsSpriteLayer(oChunkCreatorTerrainEdge, CHUNK_FILE_KEYS_TERRAIN_EDGE);
mChunkSaverProcessObjectsAsSpriteLayer(oChunkCreatorTerrainDecorum, CHUNK_FILE_KEYS_TERRAIN_DECORUM);
mChunkSaverProcessObjectsAsSpriteLayer(oChunkCreatorOverheadWalls, CHUNK_FILE_KEYS_OVERHEAD_WALLS);
mChunkSaverProcessObjectsAsSpriteLayer(oChunkCreatorOverheadRoof, CHUNK_FILE_KEYS_OVERHEAD_ROOFS);
mChunkSaverProcessObjectsAsSpriteLayer(oChunkCreatorOverheadDecorum, CHUNK_FILE_KEYS_OVERHEAD_DECORUM);

with (oChunkCreatorOverheadParallaxItem)
{
	x += 512;
	y += 512;
}

mChunkSaverProcessObjectsAsSpriteLayer(oChunkCreatorOverheadParallaxItem, CHUNK_FILE_KEYS_OVERHEAD_PARALLAX);

//Process all instances into JSON.
mChunkSaverProcessInstances();

//Get info about the chunk via the room name, including what the file name will be.
mChunkSaverInfoFromRoomName();

//Actually output the file.
mChunkSaverWriteFile();

//Clear unused data structures.
ds_map_destroy(chunkInfo);

//And that's a wrap. We either exit or move onto the next room if the multi builder is active.
mChunkSaverCheckContinueMultiBuild();