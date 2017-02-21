// Dependencies
import riot from 'riot';

// Modules
import '../page-layout/index.tag';

<page-homepage>
  <page-layout>
    <h1>Welcome home</h1>

    <ul>
      <li each={ parent.items }>
        {name}
      </li>
    </ul>
  </page-layout>

  <script>
    const tag = this;
    const { exampleStore } = opts.stores;

    tag.items = [];

    function setItems(items) {
      tag.items = items;
      tag.update();
    }

    tag.on('mount', () => {
      exampleStore.on('list:loaded', setItems);
      exampleStore.getList();
    });

    tag.on('unmount', () => {
      exampleStore.off('list:loaded', setItems);
    });
  </script>
</page-homepage>