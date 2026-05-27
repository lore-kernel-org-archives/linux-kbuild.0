Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDF037B014;
	Wed, 27 May 2026 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779910367; cv=none; b=H6HnDOC5uB77SK++FBMrYOfjcKhc2FPQajyqnF36S3XdGoEDy2ExxqQzIJUkeVKYlmEGKib6m2qlVPpasSWM0mAm6xYO7nEjN2pcST8O6Plresgd1a6tHFvLvdPAICcIxssfjDEUStcpaz6knSerm7lgDQmvKH6LnuRlWF/v+pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779910367; c=relaxed/simple;
	bh=kyZhNlSDqzh8l7yoNiR9oreYSQU8Ysja1AwT56cWrmg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRdrXqP42Bo+gvIp2MfyovbxQR5Gvx6evq/0rzXcis8T/sZsamjGnBiamGaLw9WN75pFE2IihC93WjBYs6VENvKDW7Jnk5Awq4Lwyxr0ucm4Vf0C1TRSLCam+yxDiYVFWW/BVN0lEDxMI18rHnq26/5UuI1QnibY38ERlOZTu0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wSJzS-000000003iR-1HQ7;
	Wed, 27 May 2026 19:32:30 +0000
Date: Wed, 27 May 2026 20:32:26 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Sterba <dsterba@suse.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hariharan Basuthkar <quic_hbasuthk@quicinc.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Filipe Manana <fdmanana@suse.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Chih-Kang Chang <gary.chang@realtek.com>,
	David Lechner <dlechner@baylibre.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>, Boris Burkov <boris@bur.io>,
	Blake Jones <blakejones@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v5 3/4] dt-bindings: wire style checker into dt_binding_check
Message-ID: <a14fdbded0acdc4fef1c1278100f2f4c6a93a488.1779908995.git.daniel@makrotopia.org>
References: <cover.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1779908995.git.daniel@makrotopia.org>

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
v5:
 - no change; depends on the new jobserver-exec fix in 2/4 so
   style failures stay visible instead of being cached

v4:
 - build the @argfile with f=$(mktemp) and remove it with rm -f
   (matching cmd_mk_schema), instead of Kbuild's $(tmp-target)
   which leaves a stale .tmp_.dt-style.checked in the build tree

v3:
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

v2:
 - dropped xargs -n200 -P$(nproc) sharding; single Python invocation
   with file list via @argfile
 - dropped `|| true`: relaxed mode is zero-output today
 - wrapped under scripts/jobserver-exec so worker count follows the
   make jobserver

 Documentation/devicetree/bindings/Makefile | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 7b668f7fd400..00149e824261 100644
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
+      cmd_chk_style = f=$$(mktemp) && $(find_cmd) > $$f && \
+		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
+		      $(PYTHON3) $(DT_CHK_STYLE) @$$f \
+		      && touch $@ || true; rm -f $$f
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
