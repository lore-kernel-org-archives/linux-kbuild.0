Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46396 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727321AbfKFQMK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 11:12:10 -0500
Received: by mail-wr1-f67.google.com with SMTP id b3so20773227wrs.13
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Nov 2019 08:12:08 -0800 (PST)
Date: Wed, 6 Nov 2019 16:12:05 +0000
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH 3/4] scripts/nsdeps: support nsdeps for external module
 builds
Message-ID: <20191106161205.GB1243@google.com>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
 <20191029123809.29301-4-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191029123809.29301-4-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 29, 2019 at 09:38:08PM +0900, Masahiro Yamada wrote:
>Apparently, scripts/nsdeps is written to take care of only in-tree
>modules. Perhaps, this is not a bug, but just a design. At least,
>Documentation/core-api/symbol-namespaces.rst focuses on in-tree modules:
>
>  Again, `make nsdeps` will eventually add the missing namespace imports for
>  in-tree modules::
>  ^^^^^^^
>
>Having said that, I already saw at least two people trying nsdeps for
>external module builds. So, it would be nice to support it.
>
>Reported-by: Steve French <smfrench@gmail.com>
>Reported-by: Jessica Yu <jeyu@kernel.org>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>

Reviewed-by: Matthias Maennich <maennich@google.com>
Tested-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

> Documentation/core-api/symbol-namespaces.rst |  3 +++
> Makefile                                     |  1 +
> scripts/Makefile.modpost                     |  2 +-
> scripts/nsdeps                               | 10 ++++++++--
> 4 files changed, 13 insertions(+), 3 deletions(-)
>
>diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
>index 982ed7b568ac..9b76337f6756 100644
>--- a/Documentation/core-api/symbol-namespaces.rst
>+++ b/Documentation/core-api/symbol-namespaces.rst
>@@ -152,3 +152,6 @@ in-tree modules::
> 	- notice the warning of modpost telling about a missing import
> 	- run `make nsdeps` to add the import to the correct code location
>
>+You can also run nsdeps for external module builds. A typical usage is::
>+
>+	$ make -C <path_to_kernel_src> M=$PWD nsdeps
>diff --git a/Makefile b/Makefile
>index 1e3f307bd49b..780a65493866 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1007,6 +1007,7 @@ endif
> PHONY += prepare0
>
> export MODORDER := $(extmod-prefix)modules.order
>+export MODULES_NSDEPS := $(extmod-prefix)modules.nsdeps
>
> ifeq ($(KBUILD_EXTMOD),)
> core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
>diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>index da37128c3f9f..8359f8af5ee6 100644
>--- a/scripts/Makefile.modpost
>+++ b/scripts/Makefile.modpost
>@@ -66,7 +66,7 @@ __modpost:
> else
>
> MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - \
>-	$(if $(KBUILD_NSDEPS),-d modules.nsdeps)
>+	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
>
> ifeq ($(KBUILD_EXTMOD),)
> MODPOST += $(wildcard vmlinux)
>diff --git a/scripts/nsdeps b/scripts/nsdeps
>index 08db427a7fe5..3b8a9e173ebf 100644
>--- a/scripts/nsdeps
>+++ b/scripts/nsdeps
>@@ -21,6 +21,12 @@ if [ "$SPATCH_VERSION_NUM" -lt "$SPATCH_REQ_VERSION_NUM" ] ; then
> 	exit 1
> fi
>
>+if [ "$KBUILD_EXTMOD" ]; then
>+	src_prefix=
>+else
>+	src_prefix=$srctree/
>+fi
>+
> generate_deps_for_ns() {
> 	$SPATCH --very-quiet --in-place --sp-file \
> 		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D ns=$1 $2
>@@ -32,7 +38,7 @@ generate_deps() {
> 	local namespaces="$*"
> 	local mod_source_files=`cat $mod.mod | sed -n 1p                      \
> 					      | sed -e 's/\.o/\.c/g'           \
>-					      | sed "s|[^ ]* *|${srctree}/&|g"`
>+					     | sed "s|[^ ]* *|${src_prefix}&|g"`
> 	for ns in $namespaces; do
> 		echo "Adding namespace $ns to module $mod.ko."
> 		generate_deps_for_ns $ns $mod_source_files
>@@ -54,4 +60,4 @@ generate_deps() {
> while read line
> do
> 	generate_deps $line
>-done < modules.nsdeps
>+done < $MODULES_NSDEPS
>-- 
>2.17.1
>
