Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:52663
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1759260AbdENPjC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 May 2017 11:39:02 -0400
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH 02/13] docs: remove DocBook from the building system
Date: Sun, 14 May 2017 12:38:36 -0300
Message-Id: <ebf137e8e3e1eafffbfb6d3d816b05f586b380cc.1494775891.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494775891.git.mchehab@s-opensource.com>
References: <cover.1494775891.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494775891.git.mchehab@s-opensource.com>
References: <cover.1494775891.git.mchehab@s-opensource.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Jani Nikula <jani.nikula@intel.com>, "Herton R. Krzesinski" <herton@redhat.com>, Markus Heiser <markus.heiser@darmarit.de>, Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, linux-kbuild@vger.kernel.org

Now that we don't have any DocBook anymore, remove it from
the building system.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/00-INDEX               |   4 --
 Documentation/DocBook/.gitignore     |  17 -----
 Documentation/DocBook/Makefile       |   1 -
 Documentation/DocBook/stylesheet.xsl |  11 ---
 Documentation/Makefile               | 125 +++++++++++++++++++++++++++++++++
 Documentation/Makefile.sphinx        | 130 -----------------------------------
 Documentation/doc-guide/docbook.rst  |  90 ------------------------
 Makefile                             |  11 ++-
 scripts/Makefile                     |   9 +--
 scripts/check-lc_ctype.c             |  11 ---
 10 files changed, 132 insertions(+), 277 deletions(-)
 delete mode 100644 Documentation/DocBook/.gitignore
 delete mode 100644 Documentation/DocBook/Makefile
 delete mode 100644 Documentation/DocBook/stylesheet.xsl
 delete mode 100644 Documentation/Makefile.sphinx
 delete mode 100644 Documentation/doc-guide/docbook.rst
 delete mode 100644 scripts/check-lc_ctype.c

diff --git a/Documentation/00-INDEX b/Documentation/00-INDEX
index 8c2a66e176b9..d0165461b024 100644
--- a/Documentation/00-INDEX
+++ b/Documentation/00-INDEX
@@ -24,8 +24,6 @@ DMA-ISA-LPC.txt
 	- How to do DMA with ISA (and LPC) devices.
 DMA-attributes.txt
 	- listing of the various possible attributes a DMA region can have
-DocBook/
-	- directory with DocBook templates etc. for kernel documentation.
 EDID/
 	- directory with info on customizing EDID for broken gfx/displays.
 IPMI.txt
@@ -40,8 +38,6 @@ Intel-IOMMU.txt
 	- basic info on the Intel IOMMU virtualization support.
 Makefile
 	- It's not of interest for those who aren't touching the build system.
-Makefile.sphinx
-	- It's not of interest for those who aren't touching the build system.
 PCI/
 	- info related to PCI drivers.
 RCU/
diff --git a/Documentation/DocBook/.gitignore b/Documentation/DocBook/.gitignore
deleted file mode 100644
index e05da3f7aa21..000000000000
--- a/Documentation/DocBook/.gitignore
+++ /dev/null
@@ -1,17 +0,0 @@
-*.xml
-*.ps
-*.pdf
-*.html
-*.9.gz
-*.9
-*.aux
-*.dvi
-*.log
-*.out
-*.png
-*.gif
-*.svg
-*.proc
-*.db
-media-indices.tmpl
-media-entities.tmpl
diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
deleted file mode 100644
index 8b137891791f..000000000000
--- a/Documentation/DocBook/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-
diff --git a/Documentation/DocBook/stylesheet.xsl b/Documentation/DocBook/stylesheet.xsl
deleted file mode 100644
index 3bf4ecf3d760..000000000000
--- a/Documentation/DocBook/stylesheet.xsl
+++ /dev/null
@@ -1,11 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" version="1.0">
-<param name="chunk.quietly">1</param>
-<param name="funcsynopsis.style">ansi</param>
-<param name="funcsynopsis.tabular.threshold">80</param>
-<param name="callout.graphics">0</param>
-<!-- <param name="paper.type">A4</param> -->
-<param name="generate.consistent.ids">1</param>
-<param name="generate.section.toc.level">2</param>
-<param name="use.id.as.filename">1</param>
-</stylesheet>
diff --git a/Documentation/Makefile b/Documentation/Makefile
index c2a469112c37..a42320385df3 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -1 +1,126 @@
+# -*- makefile -*-
+# Makefile for Sphinx documentation
+#
+
 subdir-y :=
+
+# You can set these variables from the command line.
+SPHINXBUILD   = sphinx-build
+SPHINXOPTS    =
+SPHINXDIRS    = .
+_SPHINXDIRS   = $(patsubst $(srctree)/Documentation/%/conf.py,%,$(wildcard $(srctree)/Documentation/*/conf.py))
+SPHINX_CONF   = conf.py
+PAPER         =
+BUILDDIR      = $(obj)/output
+PDFLATEX      = xelatex
+LATEXOPTS     = -interaction=batchmode
+
+# User-friendly check for sphinx-build
+HAVE_SPHINX := $(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi)
+
+ifeq ($(HAVE_SPHINX),0)
+
+.DEFAULT:
+	$(warning The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed and in PATH, or set the SPHINXBUILD make variable to point to the full path of the '$(SPHINXBUILD)' executable.)
+	@echo "  SKIP    Sphinx $@ target."
+
+else # HAVE_SPHINX
+
+# User-friendly check for pdflatex
+HAVE_PDFLATEX := $(shell if which $(PDFLATEX) >/dev/null 2>&1; then echo 1; else echo 0; fi)
+
+# Internal variables.
+PAPEROPT_a4     = -D latex_paper_size=a4
+PAPEROPT_letter = -D latex_paper_size=letter
+KERNELDOC       = $(srctree)/scripts/kernel-doc
+KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)
+ALLSPHINXOPTS   =  $(KERNELDOC_CONF) $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
+# the i18n builder cannot share the environment and doctrees with the others
+I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .
+
+# commands; the 'cmd' from scripts/Kbuild.include is not *loopable*
+loop_cmd = $(echo-cmd) $(cmd_$(1)) || exit;
+
+# $2 sphinx builder e.g. "html"
+# $3 name of the build subfolder / e.g. "media", used as:
+#    * dest folder relative to $(BUILDDIR) and
+#    * cache folder relative to $(BUILDDIR)/.doctrees
+# $4 dest subfolder e.g. "man" for man pages at media/man
+# $5 reST source folder relative to $(srctree)/$(src),
+#    e.g. "media" for the linux-tv book-set at ./Documentation/media
+
+quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
+      cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/media $2 && \
+	PYTHONDONTWRITEBYTECODE=1 \
+	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(srctree)/$(src)/$5/$(SPHINX_CONF)) \
+	$(SPHINXBUILD) \
+	-b $2 \
+	-c $(abspath $(srctree)/$(src)) \
+	-d $(abspath $(BUILDDIR)/.doctrees/$3) \
+	-D version=$(KERNELVERSION) -D release=$(KERNELRELEASE) \
+	$(ALLSPHINXOPTS) \
+	$(abspath $(srctree)/$(src)/$5) \
+	$(abspath $(BUILDDIR)/$3/$4)
+
+htmldocs:
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
+
+linkcheckdocs:
+	@$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,linkcheck,$(var),,$(var)))
+
+latexdocs:
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,latex,$(var),latex,$(var)))
+
+ifeq ($(HAVE_PDFLATEX),0)
+
+pdfdocs:
+	$(warning The '$(PDFLATEX)' command was not found. Make sure you have it installed and in PATH to produce PDF output.)
+	@echo "  SKIP    Sphinx $@ target."
+
+else # HAVE_PDFLATEX
+
+pdfdocs: latexdocs
+	$(foreach var,$(SPHINXDIRS), $(MAKE) PDFLATEX=$(PDFLATEX) LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit;)
+
+endif # HAVE_PDFLATEX
+
+epubdocs:
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
+
+xmldocs:
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,xml,$(var),xml,$(var)))
+
+endif # HAVE_SPHINX
+
+# The following targets are independent of HAVE_SPHINX, and the rules should
+# work or silently pass without Sphinx.
+
+# no-ops for the Sphinx toolchain
+sgmldocs:
+	@:
+psdocs:
+	@:
+mandocs:
+	@:
+installmandocs:
+	@:
+
+cleandocs:
+	$(Q)rm -rf $(BUILDDIR)
+	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/media clean
+
+dochelp:
+	@echo  ' Linux kernel internal documentation in different formats from ReST:'
+	@echo  '  htmldocs        - HTML'
+	@echo  '  latexdocs       - LaTeX'
+	@echo  '  pdfdocs         - PDF'
+	@echo  '  epubdocs        - EPUB'
+	@echo  '  xmldocs         - XML'
+	@echo  '  linkcheckdocs   - check for broken external links (will connect to external hosts)'
+	@echo  '  cleandocs       - clean all generated files'
+	@echo
+	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
+	@echo  '  valid values for SPHINXDIRS are: $(_SPHINXDIRS)'
+	@echo
+	@echo  '  make SPHINX_CONF={conf-file} [target] use *additional* sphinx-build'
+	@echo  '  configuration. This is e.g. useful to build with nit-picking config.'
diff --git a/Documentation/Makefile.sphinx b/Documentation/Makefile.sphinx
deleted file mode 100644
index bcf529f6cf9b..000000000000
--- a/Documentation/Makefile.sphinx
+++ /dev/null
@@ -1,130 +0,0 @@
-# -*- makefile -*-
-# Makefile for Sphinx documentation
-#
-
-# You can set these variables from the command line.
-SPHINXBUILD   = sphinx-build
-SPHINXOPTS    =
-SPHINXDIRS    = .
-_SPHINXDIRS   = $(patsubst $(srctree)/Documentation/%/conf.py,%,$(wildcard $(srctree)/Documentation/*/conf.py))
-SPHINX_CONF   = conf.py
-PAPER         =
-BUILDDIR      = $(obj)/output
-PDFLATEX      = xelatex
-LATEXOPTS     = -interaction=batchmode
-
-# User-friendly check for sphinx-build
-HAVE_SPHINX := $(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi)
-
-ifeq ($(HAVE_SPHINX),0)
-
-.DEFAULT:
-	$(warning The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed and in PATH, or set the SPHINXBUILD make variable to point to the full path of the '$(SPHINXBUILD)' executable.)
-	@echo "  SKIP    Sphinx $@ target."
-
-else ifneq ($(DOCBOOKS),)
-
-# Skip Sphinx build if the user explicitly requested DOCBOOKS.
-.DEFAULT:
-	@echo "  SKIP    Sphinx $@ target (DOCBOOKS specified)."
-
-else # HAVE_SPHINX
-
-# User-friendly check for pdflatex
-HAVE_PDFLATEX := $(shell if which $(PDFLATEX) >/dev/null 2>&1; then echo 1; else echo 0; fi)
-
-# Internal variables.
-PAPEROPT_a4     = -D latex_paper_size=a4
-PAPEROPT_letter = -D latex_paper_size=letter
-KERNELDOC       = $(srctree)/scripts/kernel-doc
-KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)
-ALLSPHINXOPTS   =  $(KERNELDOC_CONF) $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
-# the i18n builder cannot share the environment and doctrees with the others
-I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .
-
-# commands; the 'cmd' from scripts/Kbuild.include is not *loopable*
-loop_cmd = $(echo-cmd) $(cmd_$(1)) || exit;
-
-# $2 sphinx builder e.g. "html"
-# $3 name of the build subfolder / e.g. "media", used as:
-#    * dest folder relative to $(BUILDDIR) and
-#    * cache folder relative to $(BUILDDIR)/.doctrees
-# $4 dest subfolder e.g. "man" for man pages at media/man
-# $5 reST source folder relative to $(srctree)/$(src),
-#    e.g. "media" for the linux-tv book-set at ./Documentation/media
-
-quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
-      cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/media $2 && \
-	PYTHONDONTWRITEBYTECODE=1 \
-	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(srctree)/$(src)/$5/$(SPHINX_CONF)) \
-	$(SPHINXBUILD) \
-	-b $2 \
-	-c $(abspath $(srctree)/$(src)) \
-	-d $(abspath $(BUILDDIR)/.doctrees/$3) \
-	-D version=$(KERNELVERSION) -D release=$(KERNELRELEASE) \
-	$(ALLSPHINXOPTS) \
-	$(abspath $(srctree)/$(src)/$5) \
-	$(abspath $(BUILDDIR)/$3/$4)
-
-htmldocs:
-	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
-
-linkcheckdocs:
-	@$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,linkcheck,$(var),,$(var)))
-
-latexdocs:
-	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,latex,$(var),latex,$(var)))
-
-ifeq ($(HAVE_PDFLATEX),0)
-
-pdfdocs:
-	$(warning The '$(PDFLATEX)' command was not found. Make sure you have it installed and in PATH to produce PDF output.)
-	@echo "  SKIP    Sphinx $@ target."
-
-else # HAVE_PDFLATEX
-
-pdfdocs: latexdocs
-	$(foreach var,$(SPHINXDIRS), $(MAKE) PDFLATEX=$(PDFLATEX) LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit;)
-
-endif # HAVE_PDFLATEX
-
-epubdocs:
-	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
-
-xmldocs:
-	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,xml,$(var),xml,$(var)))
-
-endif # HAVE_SPHINX
-
-# The following targets are independent of HAVE_SPHINX, and the rules should
-# work or silently pass without Sphinx.
-
-# no-ops for the Sphinx toolchain
-sgmldocs:
-	@:
-psdocs:
-	@:
-mandocs:
-	@:
-installmandocs:
-	@:
-
-cleandocs:
-	$(Q)rm -rf $(BUILDDIR)
-	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/media clean
-
-dochelp:
-	@echo  ' Linux kernel internal documentation in different formats (Sphinx):'
-	@echo  '  htmldocs        - HTML'
-	@echo  '  latexdocs       - LaTeX'
-	@echo  '  pdfdocs         - PDF'
-	@echo  '  epubdocs        - EPUB'
-	@echo  '  xmldocs         - XML'
-	@echo  '  linkcheckdocs   - check for broken external links (will connect to external hosts)'
-	@echo  '  cleandocs       - clean all generated files'
-	@echo
-	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
-	@echo  '  valid values for SPHINXDIRS are: $(_SPHINXDIRS)'
-	@echo
-	@echo  '  make SPHINX_CONF={conf-file} [target] use *additional* sphinx-build'
-	@echo  '  configuration. This is e.g. useful to build with nit-picking config.'
diff --git a/Documentation/doc-guide/docbook.rst b/Documentation/doc-guide/docbook.rst
deleted file mode 100644
index d8bf04308b43..000000000000
--- a/Documentation/doc-guide/docbook.rst
+++ /dev/null
@@ -1,90 +0,0 @@
-DocBook XML [DEPRECATED]
-========================
-
-.. attention::
-
-   This section describes the deprecated DocBook XML toolchain. Please do not
-   create new DocBook XML template files. Please consider converting existing
-   DocBook XML templates files to Sphinx/reStructuredText.
-
-Converting DocBook to Sphinx
-----------------------------
-
-Over time, we expect all of the documents under ``Documentation/DocBook`` to be
-converted to Sphinx and reStructuredText. For most DocBook XML documents, a good
-enough solution is to use the simple ``Documentation/sphinx/tmplcvt`` script,
-which uses ``pandoc`` under the hood. For example::
-
-  $ cd Documentation/sphinx
-  $ ./tmplcvt ../DocBook/in.tmpl ../out.rst
-
-Then edit the resulting rst files to fix any remaining issues, and add the
-document in the ``toctree`` in ``Documentation/index.rst``.
-
-Components of the kernel-doc system
------------------------------------
-
-Many places in the source tree have extractable documentation in the form of
-block comments above functions. The components of this system are:
-
-- ``scripts/kernel-doc``
-
-  This is a perl script that hunts for the block comments and can mark them up
-  directly into reStructuredText, DocBook, man, text, and HTML. (No, not
-  texinfo.)
-
-- ``Documentation/DocBook/*.tmpl``
-
-  These are XML template files, which are normal XML files with special
-  place-holders for where the extracted documentation should go.
-
-- ``scripts/docproc.c``
-
-  This is a program for converting XML template files into XML files. When a
-  file is referenced it is searched for symbols exported (EXPORT_SYMBOL), to be
-  able to distinguish between internal and external functions.
-
-  It invokes kernel-doc, giving it the list of functions that are to be
-  documented.
-
-  Additionally it is used to scan the XML template files to locate all the files
-  referenced herein. This is used to generate dependency information as used by
-  make.
-
-- ``Makefile``
-
-  The targets 'xmldocs', 'psdocs', 'pdfdocs', and 'htmldocs' are used to build
-  DocBook XML files, PostScript files, PDF files, and html files in
-  Documentation/DocBook. The older target 'sgmldocs' is equivalent to 'xmldocs'.
-
-- ``Documentation/DocBook/Makefile``
-
-  This is where C files are associated with SGML templates.
-
-How to use kernel-doc comments in DocBook XML template files
-------------------------------------------------------------
-
-DocBook XML template files (\*.tmpl) are like normal XML files, except that they
-can contain escape sequences where extracted documentation should be inserted.
-
-``!E<filename>`` is replaced by the documentation, in ``<filename>``, for
-functions that are exported using ``EXPORT_SYMBOL``: the function list is
-collected from files listed in ``Documentation/DocBook/Makefile``.
-
-``!I<filename>`` is replaced by the documentation for functions that are **not**
-exported using ``EXPORT_SYMBOL``.
-
-``!D<filename>`` is used to name additional files to search for functions
-exported using ``EXPORT_SYMBOL``.
-
-``!F<filename> <function [functions...]>`` is replaced by the documentation, in
-``<filename>``, for the functions listed.
-
-``!P<filename> <section title>`` is replaced by the contents of the ``DOC:``
-section titled ``<section title>`` from ``<filename>``. Spaces are allowed in
-``<section title>``; do not quote the ``<section title>``.
-
-``!C<filename>`` is replaced by nothing, but makes the tools check that all DOC:
-sections and documented functions, symbols, etc. are used. This makes sense to
-use when you use ``!F`` or ``!P`` only and want to verify that all documentation
-is included.
diff --git a/Makefile b/Makefile
index 220121fdca4d..80be98ccca60 100644
--- a/Makefile
+++ b/Makefile
@@ -1298,7 +1298,7 @@ clean: archclean vmlinuxclean
 #
 mrproper: rm-dirs  := $(wildcard $(MRPROPER_DIRS))
 mrproper: rm-files := $(wildcard $(MRPROPER_FILES))
-mrproper-dirs      := $(addprefix _mrproper_,Documentation/DocBook scripts)
+mrproper-dirs      := $(addprefix _mrproper_,scripts)
 
 PHONY += $(mrproper-dirs) mrproper archmrproper
 $(mrproper-dirs):
@@ -1400,9 +1400,7 @@ help:
 	@$(MAKE) $(build)=$(package-dir) help
 	@echo  ''
 	@echo  'Documentation targets:'
-	@$(MAKE) -f $(srctree)/Documentation/Makefile.sphinx dochelp
-	@echo  ''
-	@$(MAKE) -f $(srctree)/Documentation/DocBook/Makefile dochelp
+	@$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
 	@echo  ''
 	@echo  'Architecture specific targets ($(SRCARCH)):'
 	@$(if $(archhelp),$(archhelp),\
@@ -1453,9 +1451,8 @@ $(help-board-dirs): help-%:
 DOC_TARGETS := xmldocs sgmldocs psdocs latexdocs pdfdocs htmldocs mandocs installmandocs epubdocs cleandocs linkcheckdocs
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS): scripts_basic FORCE
-	$(Q)$(MAKE) $(build)=scripts build_docproc build_check-lc_ctype
-	$(Q)$(MAKE) $(build)=Documentation -f $(srctree)/Documentation/Makefile.sphinx $@
-	$(Q)$(MAKE) $(build)=Documentation/DocBook $@
+	$(Q)$(MAKE) $(build)=scripts build_docproc
+	$(Q)$(MAKE) $(build)=Documentation $@
 
 else # KBUILD_EXTMOD
 
diff --git a/scripts/Makefile b/scripts/Makefile
index 1d80897a9644..55550e4141c4 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -6,8 +6,7 @@
 # pnmttologo:    Convert pnm files to logo files
 # conmakehash:   Create chartable
 # conmakehash:	 Create arrays for initializing the kernel console tables
-# docproc:       Used in Documentation/DocBook
-# check-lc_ctype: Used in Documentation/DocBook
+# docproc:       Used in Documentation/
 
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include
 
@@ -29,16 +28,14 @@ HOSTLOADLIBES_extract-cert = -lcrypto
 always		:= $(hostprogs-y) $(hostprogs-m)
 
 # The following hostprogs-y programs are only build on demand
-hostprogs-y += unifdef docproc check-lc_ctype
+hostprogs-y += unifdef docproc
 
 # These targets are used internally to avoid "is up to date" messages
-PHONY += build_unifdef build_docproc build_check-lc_ctype
+PHONY += build_unifdef build_docproc
 build_unifdef: $(obj)/unifdef
 	@:
 build_docproc: $(obj)/docproc
 	@:
-build_check-lc_ctype: $(obj)/check-lc_ctype
-	@:
 
 subdir-$(CONFIG_MODVERSIONS) += genksyms
 subdir-y                     += mod
diff --git a/scripts/check-lc_ctype.c b/scripts/check-lc_ctype.c
deleted file mode 100644
index 9097ff5449fb..000000000000
--- a/scripts/check-lc_ctype.c
+++ /dev/null
@@ -1,11 +0,0 @@
-/*
- * Check that a specified locale works as LC_CTYPE.  Used by the
- * DocBook build system to probe for C.UTF-8 support.
- */
-
-#include <locale.h>
-
-int main(void)
-{
-	return !setlocale(LC_CTYPE, "");
-}
-- 
2.9.3

