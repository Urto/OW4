///@arg loadingWorldChunk - the world chunk to load info into.
///@arg worldChunkX - The leftmost pixel of this world chunk.
///@arg worldChunkY - The topmost pixel of this world chunk.
///@arg chunkInfo - The ds_map containing the info to populate the chunk with.
///@arg chunkName - The name of this chunk for giving CHIDs.


var _loadingWorldChunk = argument0;
var _chunkX = argument1;
var _chunkY = argument2;
var _chunkInfo = argument3;
var _chunkName = argument4;


_loadingWorldChunk.x = _chunkX;
_loadingWorldChunk.y = _chunkY;

//Let's just double check that nothing happened to the chunkfileInfo. Should still be a ds_map.
if (ds_exists(_chunkInfo, ds_type_map))
{
	//Grab the strings which represent the various bits of data.
	var _chunkTilesString = ds_map_find_value(_chunkInfo, "chunkTiles");
	var _chunkTerrainWallsString = ds_map_find_value(_chunkInfo, CHUNK_FILE_KEYS_TERRAIN_WALLS);
	var _chunkTerrainEdgesString = ds_map_find_value(_chunkInfo, CHUNK_FILE_KEYS_TERRAIN_EDGE);
	var _chunkTerrainDecorumString = ds_map_find_value(_chunkInfo, CHUNK_FILE_KEYS_TERRAIN_DECORUM);
	var _chunkOverheadRoofsString = ds_map_find_value(_chunkInfo, CHUNK_FILE_KEYS_OVERHEAD_ROOFS);
	var _chunkOverheadDecorumString = ds_map_find_value(_chunkInfo, CHUNK_FILE_KEYS_OVERHEAD_DECORUM);
	var _instanceListString = ds_map_find_value(_chunkInfo, "chunkInstances");
	var _parallaxString = ds_map_find_value(_chunkInfo, CHUNK_FILE_KEYS_OVERHEAD_PARALLAX);
	
	
	
	mChunkLoaderPopulateTerrainTiles(_loadingWorldChunk, _chunkTilesString);
	mChunkLoaderPopulateTerrainWalls(_loadingWorldChunk, _chunkTerrainWallsString);
	mChunkLoaderPopulateTerrainEdges(_loadingWorldChunk, _chunkTerrainEdgesString);
	mChunkLoaderPopulateTerrainDecorum(_loadingWorldChunk, _chunkTerrainDecorumString);
	mChunkLoaderPopulateOverheadRoofs(_loadingWorldChunk.overheadCanvas, _chunkOverheadRoofsString);
	mChunkLoaderPopulateOverheadDecorum(_loadingWorldChunk.overheadCanvas, _chunkOverheadDecorumString);
	mChunkLoaderPopulateOverheadParallax(_loadingWorldChunk.overheadParallaxCanvas, _parallaxString);
	mChunkLoaderPopulateInstancesAll(_loadingWorldChunk, _instanceListString, _chunkX, _chunkY, _chunkName);
	
}
