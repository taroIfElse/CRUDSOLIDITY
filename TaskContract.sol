// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract TaskContract{

uint nextId=1;
 
 struct Task{
     uint Id;
     string Name;
     string Description;
 }

 Task[] tasks;
 
function createTask( string memory _name, string memory _description ) public  {
tasks.push(Task(nextId,_name, _description));
nextId++;
}

function findIndex(uint _id) internal view returns(uint){
for(uint i = 0; i < tasks.length; i++){
if(tasks[i].Id == _id){
return i;
}
}
revert("Task not found");
}

function readTask( uint _id ) public view returns ( uint, string memory, string memory )  {
uint index = findIndex( _id );
return (tasks[index].Id, tasks[index].Name, tasks[index].Description);
}

function update( uint _id , string memory _name, string memory _description ) public{
uint indexUpdate = findIndex(_id);
tasks[indexUpdate].Name = _name;
tasks[indexUpdate].Description  = _description;

} 

function eliminarTask(uint _id) public{
uint indexEliminar = findIndex(_id);
tasks[indexEliminar].Name = "";
tasks[indexEliminar].Description = "";
}
}