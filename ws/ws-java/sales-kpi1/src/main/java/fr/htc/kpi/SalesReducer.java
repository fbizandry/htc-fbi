package fr.htc.kpi;

import java.io.IOException;

import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class SalesReducer extends Mapper<Object, Text, Text, FloatWritable> {
	private FloatWritable caByStore = new FloatWritable();

	protected void reduce(Text storeNameKey, Iterable<FloatWritable> caValues, Context context)
			throws IOException, InterruptedException {

		float sum = 0f;
		for (FloatWritable ca : caValues) {
			sum += ca.get();
		}
		caByStore.set(sum);
		context.write(storeNameKey, caByStore);
	}
}
