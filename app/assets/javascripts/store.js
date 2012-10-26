Brewery.store = DS.Store.create({
  revision: 6,
  adapter: DS.RESTAdapter.create({
    mappings: {
      weighted_grains: Brewery.WeightedGrain
    }
  }),
  bulkCommit: false
});

