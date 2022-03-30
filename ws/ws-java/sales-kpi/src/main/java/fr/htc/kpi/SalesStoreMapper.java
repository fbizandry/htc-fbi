package fr.htc.kpi;

import java.io.IOException;

import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class SalesStoreMapper extends Mapper<Object, Text, Text, FloatWritable> {
	private Text storeName = new Text();
	private FloatWritable caByLine = new FloatWritable();

	@Override
	protected void map(Object key, Text csvLine, Context context) throws IOException, InterruptedException {

		String[] tokens = csvLine.toString().split(";");
		float storeSales = Float.parseFloat(tokens[5]);
		float unitSales = Float.parseFloat(tokens[7]);

		storeName.set(tokens[72]);
		caByLine.set(storeSales * unitSales);

		context.write(storeName, caByLine);
	}

}
