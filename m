Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:49188 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753961AbbATMwJ convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:5:1>);
	Tue, 20 Jan 2015 07:52:09 -0500
Message-Id: <54BE5D87020000780005705F@mail.emea.novell.com>
Date: Tue, 20 Jan 2015 12:52:07 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 1/3] trivial: sound/soc/intel/Kconfig: use single
 backslash for line continuation
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: trivial@kernel.org, akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, pebolle@tiscali.nl

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 sound/soc/intel/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- 3.19-rc5-kconfig.orig/sound/soc/intel/Kconfig
+++ 3.19-rc5-kconfig/sound/soc/intel/Kconfig
@@ -46,7 +46,7 @@ config SND_SOC_INTEL_BAYTRAIL
 
 config SND_SOC_INTEL_HASWELL_MACH
 	tristate "ASoC Audio DSP support for Intel Haswell Lynxpoint"
-	depends on SND_SOC_INTEL_SST && X86_INTEL_LPSS && I2C && \\
+	depends on SND_SOC_INTEL_SST && X86_INTEL_LPSS && I2C && \
 		   I2C_DESIGNWARE_PLATFORM
 	select SND_SOC_INTEL_HASWELL
 	select SND_SOC_RT5640
@@ -76,7 +76,7 @@ config SND_SOC_INTEL_BYT_MAX98090_MACH
 
 config SND_SOC_INTEL_BROADWELL_MACH
 	tristate "ASoC Audio DSP support for Intel Broadwell Wildcatpoint"
-	depends on SND_SOC_INTEL_SST && X86_INTEL_LPSS && DW_DMAC && \\
+	depends on SND_SOC_INTEL_SST && X86_INTEL_LPSS && DW_DMAC && \
 		   I2C_DESIGNWARE_PLATFORM
 	select SND_SOC_INTEL_HASWELL
 	select SND_COMPRESS_OFFLOAD



