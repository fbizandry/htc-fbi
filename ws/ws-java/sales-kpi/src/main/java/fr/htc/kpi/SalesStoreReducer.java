package fr.htc.kpi;

import java.io.IOException;

import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class SalesStoreReducer extends Reducer<Text, FloatWritable, Text, FloatWritable> {
	private FloatWritable caByStore = new FloatWritable();

	@Override
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
