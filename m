Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA7936A009;
	Sun, 10 May 2026 23:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778457539; cv=none; b=MF45Wua1CeGl0ZneUESlJBnheKmvJQu1GApwsUU/uglH0sLjNl7uy1PpBbagYngGKg04KDBKC1OYi0DsPpXi5Hf5Q0+AXOFEbgfKHv4QDBNQSp1KapdaaStCOcKDV54lc8T8hNp9mSsLEA4D1JBHoMU8dSykQF9Orcj+hjuFgn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778457539; c=relaxed/simple;
	bh=eJPtCS9J3HhuHQYsv18hVc5sQbCbBcD5Rcy2wX7nSPE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2zDgiymyIKgJ6jGpMreBMkmE69g9DAhhog7iZFSzPcjqzESSQaz7JwMevwkB9MtnLiUMA7QJCKmPw7sN9LWjT/0XOsGWLyQyT1WiPHW0V4K6u1aa61ok2Jnyb2Vp7tLLUexzpWz663Qxug+TF1c1FKfPqQ9bTPnXPJw5Hwkh+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wME2v-000000000N3-34Gq;
	Sun, 10 May 2026 23:58:53 +0000
Date: Mon, 11 May 2026 00:58:50 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Guenter Roeck <linux@roeck-us.net>, Test User <test@example.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: wire style checker into dt_binding_check
Message-ID: <15c7795ac1c2a6aa71fc6967223869b0b285f4c9.1778454442.git.daniel@makrotopia.org>
References: <cover.1778454442.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1778454442.git.daniel@makrotopia.org>

Run dt-check-style as part of dt_binding_check_one. The recipe wraps
the tool with scripts/jobserver-exec so worker count follows the GNU
make jobserver -- `make -j N dt_binding_check` constrains the checker
to N workers rather than spawning one per CPU.

Default mode (relaxed) is zero-violation on the current tree, so this
does not introduce new warnings into make dt_binding_check. Stricter
rules are available via --mode=strict (eg. for use by checkpatch.pl in
a future series).

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v2:
 - use Kbuild's $(tmp-target) instead of mktemp so build output
   stays inside the build folder (Nathan)
 - collapse the conditional cleanup tail into the familiar
   "&& touch $@ || true" pattern, matching cmd_chk_bindings;
   keeps future warnings non-fatal (Rob, Nathan)
 - retained the explicit $(PYTHON3) prefix (Rob asked why it
   differs from the rest of this Makefile): per
   Documentation/kbuild/makefiles.rst "Script invocation",
   in-tree scripts should be called through their interpreter so
   the executable bit and shebang are not relied on and the
   user's $(PYTHON3) override is respected. The neighbouring
   recipes invoke their Python helpers directly because those
   come from external packages (dtschema's dt-extract-*,
   dt-check-compatible, dt-doc-validate), which is the case Rob
   asked about and which sits outside that rule.

Changes since v1:
 - dropped xargs -n200 -P$(nproc) sharding; single Python invocation
   with file list via @argfile
 - dropped `|| true`: relaxed mode is zero-output today
 - wrapped under scripts/jobserver-exec so worker count follows the
   make jobserver

 Documentation/devicetree/bindings/Makefile | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 7b668f7fd400..df4c4e0da1dc 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -46,6 +46,18 @@ quiet_cmd_chk_bindings = CHKDT   $(src)
 			  xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(src)) \
 			  && touch $@ || true
 
+DT_CHK_STYLE = $(srctree)/scripts/dtc/dt-check-style
+
+# Feed the file list to the checker via @argfile in a single Python
+# process so the ruamel.yaml import is paid once. scripts/jobserver-exec
+# claims slots from the GNU make jobserver and exposes the count via
+# $PARALLELISM, which dt-check-style picks up to size its worker pool.
+quiet_cmd_chk_style = STYLE   $(src)
+      cmd_chk_style = $(find_cmd) > $(tmp-target) && \
+		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
+		      $(PYTHON3) $(DT_CHK_STYLE) @$(tmp-target) \
+		      && touch $@ || true
+
 quiet_cmd_mk_schema = SCHEMA  $@
       cmd_mk_schema = f=$$(mktemp) ; \
                       $(find_all_cmd) > $$f ; \
@@ -62,13 +74,16 @@ override DTC_FLAGS := \
 $(obj)/processed-schema.json: $(DT_DOCS) check_dtschema_version FORCE
 	$(call if_changed,mk_schema)
 
-targets += .dt-binding.checked .yamllint.checked
+targets += .dt-binding.checked .yamllint.checked .dt-style.checked
 $(obj)/.yamllint.checked: $(DT_DOCS) $(src)/.yamllint FORCE
 	$(if $(DT_SCHEMA_LINT),$(call if_changed,yamllint),)
 
 $(obj)/.dt-binding.checked: $(DT_DOCS) FORCE
 	$(call if_changed,chk_bindings)
 
+$(obj)/.dt-style.checked: $(DT_DOCS) FORCE
+	$(call if_changed,chk_style)
+
 always-y += processed-schema.json
 targets += $(patsubst $(obj)/%,%, $(CHK_DT_EXAMPLES))
 targets += $(patsubst $(obj)/%.dtb,%.dts, $(CHK_DT_EXAMPLES))
@@ -82,7 +97,7 @@ dt_compatible_check: $(obj)/processed-schema.json
 	$(Q)$(srctree)/scripts/dtc/dt-extract-compatibles $(srctree) | xargs dt-check-compatible -v -s $<
 
 PHONY += dt_binding_check_one
-dt_binding_check_one: $(obj)/.dt-binding.checked $(obj)/.yamllint.checked
+dt_binding_check_one: $(obj)/.dt-binding.checked $(obj)/.yamllint.checked $(obj)/.dt-style.checked
 
 PHONY += dt_binding_check
 dt_binding_check: dt_binding_check_one $(CHK_DT_EXAMPLES)
-- 
2.54.0
