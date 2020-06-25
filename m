Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:51074 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404536AbgFYRFN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 13:05:13 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/4] dt-bindings: fix error in 'make clean' after 'make dt_binding_check'
Date: Fri, 26 Jun 2020 02:04:31 +0900
Message-Id: <20200625170434.635114-2-masahiroy@kernel.org>
In-Reply-To: <20200625170434.635114-1-masahiroy@kernel.org>
References: <20200625170434.635114-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

We are having more and more schema files.

Commit 8b6b80218b01 ("dt-bindings: Fix command line length limit
calling dt-mk-schema") fixed the 'Argument list too long' error of
the schema checks, but the same error happens while cleaning too.

'make clean' after 'make dt_binding_check' fails as follows:

  $ make dt_binding_check
    [ snip ]
  $ make clean
  make[2]: execvp: /bin/sh: Argument list too long
  make[2]: *** [scripts/Makefile.clean:52: __clean] Error 127
  make[1]: *** [scripts/Makefile.clean:66: Documentation/devicetree/bindings] Error 2
  make: *** [Makefile:1763: _clean_Documentation] Error 2

'make dt_binding_check' generates so many .example.dts, .dt.yaml files,
which are passed to the 'rm' command when you run 'make clean'.

I added a small hack to use the 'find' command to clean up most of the
build artifacts before they are processed by scripts/Makefile.clean

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/devicetree/bindings/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index a63898954068..f20d234aec46 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -53,3 +53,8 @@ $(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) check_dtschema_version FORCE
 	$(call if_changed,mk_schema)
 
 extra-y += processed-schema.yaml
+
+# Hack: avoid 'Argument list too long' error for 'make clean'. Remove most of
+# build artifacts here before they are processed by scripts/Makefile.clean
+clean-files = $(shell find $(obj) \( -name '*.example.dts' -o \
+			-name '*.example.dt.yaml' \) -delete 2>/dev/null)
-- 
2.25.1
