function get_id(name, IP_arr){
	for(i=0 ; i<IP_arr.length() ; i++){
		if(name == IP_arr[i]){
			id = i;
		}
	}
	return id;
}

//function get_server_location(server){}
const topologyData = {
    nodes: [
        // Servers
        { id: 0, x: 450, y: -100, name: "192.168.1.155", device_type: "server", color: "grey" },
        { id: 1, x: 550, y: -100, name: "172.6.5.42", device_type: "server", color: "grey" },

        // WAS
        { id: 2, x: 500, y: -50, name: "192.168.217.1", device_type: "server", color: "red" },

        // DB
        { id: 3, x: 500, y: 0, name: "192.168.64.1", device_type: "switch" }
    ],
    links: [
      // from Servers
      { source: 0, target: 2, color: "green" },
      { source: 0, target: 3 },
      { source: 1, target: 3 },
  
      // from WAS
      { source: 2, target: 0, color: "green" },
      { source: 2, target: 3 },
  
      // form DB
      { source: 3, target: 0 },
      { source: 3, target: 1 },
      { source: 3, target: 2 }
  
    ]
};

topology.on("topologyGenerated", function() {

	var groupsLayer = topology.getLayer("groups");
	var nodesDict = topology.getLayer("nodes").nodeDictionary();

	var nodes1 = [nodesDict.getItem("192.168.1.155"), nodesDict.getItem("172.6.5.42")];
	var group1 = groupsLayer.addGroup({
		nodes: nodes1,
		label: '123',
		color: '#f00',
		group: 'group1'
	});

	var nodes2 = [nodesDict.getItem("192.168.217.1"), nodesDict.getItem("192.168.64.1")];
	var group2 = groupsLayer.addGroup({
		nodes: nodes2,
		label: 'Texas',
		color: '#0f0',
		id: 'group2'
	});

});