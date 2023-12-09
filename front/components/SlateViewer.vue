<template>
  <section class="slate-view"></section>
</template>
  
<script>
export default {
  name: 'SlateViewer',
  props: {
    value: {
      type: Array,
      default: () => [],
    },
  },
  watch: {
    value () {
      this.injectContent();
    }
  },
  mounted () {
    this.injectContent();
  },
  methods: {
    injectContent () {
      if (process.browser) {
        const tree = document.createElement('div');

        for (const node of this.value) {
          if (node.type === 'paragraph') {
            const p = document.createElement('p');
            p.className = 'slate-heading';
            p.textContent = node.children[0]?.text;
            tree.append(p);
          }

          if (node.type === 'layout') {
            const layout = document.createElement('div');
            layout.className = 'slate-layout';
            const l1 = document.createElement('div');
            l1.className = 'slate-layout-elem';
            const l2 = document.createElement('div');
            l2.className = 'slate-layout-elem';

            for (const child of node.children[0]?.children) {
              if (child?.type === 'paragraph') {
                const p = document.createElement('p');
                p.className = 'slate-p';
                p.textContent = child.children[0]?.text;
                l1.append(p);
              }
            }

            for (const child of node.children[1]?.children) {
              if (child?.type === 'paragraph') {
                const p = document.createElement('p');
                p.className = 'slate-p';
                p.textContent = child.children[0]?.text;
                l2.append(p);
              }
            }

            layout.append(l1);
            layout.append(l2);

            tree.append(layout);
          }
        }

        const container = document.querySelector('.slate-view');
        container.append(tree);
      }
    },
  },
};
</script>
