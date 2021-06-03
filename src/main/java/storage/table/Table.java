package storage.table;

public class Table {
	private int tableID;
	private String tableName;
	private int tablePeople;
	private String tableContent;

	public int getTablePeople() {
		return tablePeople;
	}

	public void setTablePeople(int tablePeople) {
		this.tablePeople = tablePeople;
	}

	public String getTableContent() {
		return tableContent;
	}

	public void setTableContent(String tableContent) {
		this.tableContent = tableContent;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	public int getTableID() {
		return tableID;
	}

	public void setTableID(int tableID) {
		this.tableID = tableID;
	}
}
