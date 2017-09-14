Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:57750 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751758AbdINVdv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Sep 2017 17:33:51 -0400
Date: Thu, 14 Sep 2017 14:33:39 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] firmware: delete in-kernel firmware
Message-ID: <20170914213339.GA3072@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Kyle McMartin <kyle@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

The last firmware change for the in-kernel firmware source code was back
in 2013.  Everyone has been relying on the out-of-tree linux-firmware
package for a long long time.

So let's drop it, it's baggage we don't need to keep dragging around
(and having to fix random kbuild issues over time...)

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Kyle McMartin <kyle@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

This has gone on too long, let's just drop it for 4.14.  Any objections?

 Makefile                                    |    16 +-
 firmware/.gitignore                         |     6 -
 firmware/3com/typhoon.bin.ihex              |  2819 -----
 firmware/Makefile                           |   238 -
 firmware/README.AddingFirmware              |    45 -
 firmware/WHENCE                             |   854 --
 firmware/acenic/tg1.bin.ihex                |  4573 --------
 firmware/acenic/tg2.bin.ihex                |  4844 --------
 firmware/adaptec/starfire_rx.bin.ihex       |    53 -
 firmware/adaptec/starfire_tx.bin.ihex       |    53 -
 firmware/advansys/3550.bin.ihex             |   317 -
 firmware/advansys/38C0800.bin.ihex          |   336 -
 firmware/advansys/38C1600.bin.ihex          |   398 -
 firmware/advansys/mcode.bin.ihex            |   147 -
 firmware/atmsar11.HEX                       |   204 -
 firmware/av7110/Boot.S                      |   109 -
 firmware/av7110/bootcode.bin.ihex           |    15 -
 firmware/bnx2/bnx2-mips-06-6.2.1.fw.ihex    |  5818 ----------
 firmware/bnx2/bnx2-mips-09-6.2.1a.fw.ihex   |  6512 -----------
 firmware/bnx2/bnx2-rv2p-06-6.0.15.fw.ihex   |   366 -
 firmware/bnx2/bnx2-rv2p-09-6.0.17.fw.ihex   |   392 -
 firmware/bnx2/bnx2-rv2p-09ax-6.0.17.fw.ihex |   425 -
 firmware/bnx2x/bnx2x-e1-6.2.9.0.fw.ihex     |  9484 ----------------
 firmware/bnx2x/bnx2x-e1h-6.2.9.0.fw.ihex    | 13192 ----------------------
 firmware/bnx2x/bnx2x-e2-6.2.9.0.fw.ihex     | 15473 --------------------------
 firmware/cis/.gitignore                     |     1 -
 firmware/cis/3CCFEM556.cis.ihex             |    13 -
 firmware/cis/3CXEM556.cis.ihex              |    13 -
 firmware/cis/COMpad2.cis.ihex               |    11 -
 firmware/cis/COMpad4.cis.ihex               |     9 -
 firmware/cis/DP83903.cis.ihex               |    14 -
 firmware/cis/LA-PCM.cis.ihex                |    20 -
 firmware/cis/MT5634ZLX.cis.ihex             |    11 -
 firmware/cis/NE2K.cis.ihex                  |     8 -
 firmware/cis/PCMLM28.cis.ihex               |    18 -
 firmware/cis/PE-200.cis.ihex                |     9 -
 firmware/cis/PE520.cis.ihex                 |     9 -
 firmware/cis/RS-COM-2P.cis.ihex             |    10 -
 firmware/cis/SW_555_SER.cis.ihex            |    12 -
 firmware/cis/SW_7xx_SER.cis.ihex            |    13 -
 firmware/cis/SW_8xx_SER.cis.ihex            |    13 -
 firmware/cis/tamarack.cis.ihex              |    10 -
 firmware/cpia2/stv0672_vp4.bin.ihex         |    73 -
 firmware/cxgb3/ael2005_opt_edc.bin.ihex     |    69 -
 firmware/cxgb3/ael2005_twx_edc.bin.ihex     |    93 -
 firmware/cxgb3/ael2020_twx_edc.bin.ihex     |   100 -
 firmware/cxgb3/t3b_psram-1.1.0.bin.ihex     |   162 -
 firmware/cxgb3/t3c_psram-1.1.0.bin.ihex     |   162 -
 firmware/dsp56k/bootstrap.asm               |    98 -
 firmware/dsp56k/bootstrap.bin.ihex          |    26 -
 firmware/e100/d101m_ucode.bin.ihex          |    38 -
 firmware/e100/d101s_ucode.bin.ihex          |    38 -
 firmware/e100/d102e_ucode.bin.ihex          |    38 -
 firmware/edgeport/boot.H16                  |    29 -
 firmware/edgeport/boot2.H16                 |    28 -
 firmware/edgeport/down.H16                  |    29 -
 firmware/edgeport/down2.H16                 |    29 -
 firmware/edgeport/down3.bin.ihex            |   815 --
 firmware/emi26/bitstream.HEX                |  4391 --------
 firmware/emi26/firmware.HEX                 |  1261 ---
 firmware/emi26/loader.HEX                   |   116 -
 firmware/emi62/bitstream.HEX                |  6107 ----------
 firmware/emi62/loader.HEX                   |   107 -
 firmware/emi62/midi.HEX                     |  1266 ---
 firmware/emi62/spdif.HEX                    |  1257 ---
 firmware/ess/maestro3_assp_kernel.fw.ihex   |   120 -
 firmware/ess/maestro3_assp_minisrc.fw.ihex  |    51 -
 firmware/ihex2fw.c                          |   281 -
 firmware/kaweth/new_code.bin.ihex           |   206 -
 firmware/kaweth/new_code_fix.bin.ihex       |    40 -
 firmware/kaweth/trigger_code.bin.ihex       |    13 -
 firmware/kaweth/trigger_code_fix.bin.ihex   |     3 -
 firmware/keyspan/mpr.HEX                    |   104 -
 firmware/keyspan/usa18x.HEX                 |   141 -
 firmware/keyspan/usa19.HEX                  |   101 -
 firmware/keyspan/usa19qi.HEX                |   101 -
 firmware/keyspan/usa19qw.HEX                |   142 -
 firmware/keyspan/usa19w.HEX                 |   141 -
 firmware/keyspan/usa28.HEX                  |   148 -
 firmware/keyspan/usa28x.HEX                 |   141 -
 firmware/keyspan/usa28xa.HEX                |   141 -
 firmware/keyspan/usa28xb.HEX                |   142 -
 firmware/keyspan/usa49w.HEX                 |   145 -
 firmware/keyspan/usa49wlc.HEX               |   153 -
 firmware/keyspan_pda/keyspan_pda.HEX        |    83 -
 firmware/keyspan_pda/keyspan_pda.S          |  1124 --
 firmware/keyspan_pda/xircom_pgs.HEX         |    87 -
 firmware/keyspan_pda/xircom_pgs.S           |  1192 --
 firmware/korg/k1212.dsp.ihex                |   987 --
 firmware/matrox/g200_warp.H16               |    28 -
 firmware/matrox/g400_warp.H16               |    44 -
 firmware/mts_cdma.fw.ihex                   |   867 --
 firmware/mts_edge.fw.ihex                   |   881 --
 firmware/mts_gsm.fw.ihex                    |   867 --
 firmware/myricom/lanai.bin.ihex             |  4771 --------
 firmware/ositech/Xilinx7OD.bin.ihex         |   177 -
 firmware/qlogic/1040.bin.ihex               |  2111 ----
 firmware/qlogic/12160.bin.ihex              |  1771 ---
 firmware/qlogic/1280.bin.ihex               |  2008 ----
 firmware/qlogic/isp1000.bin.ihex            |  1158 --
 firmware/qlogic/sd7220.fw.ihex              |   513 -
 firmware/r128/r128_cce.bin.ihex             |   129 -
 firmware/radeon/R100_cp.bin.ihex            |   130 -
 firmware/radeon/R200_cp.bin.ihex            |   130 -
 firmware/radeon/R300_cp.bin.ihex            |   130 -
 firmware/radeon/R420_cp.bin.ihex            |   130 -
 firmware/radeon/R520_cp.bin.ihex            |   130 -
 firmware/radeon/R600_me.bin.ihex            |  1345 ---
 firmware/radeon/R600_pfp.bin.ihex           |   145 -
 firmware/radeon/RS600_cp.bin.ihex           |   130 -
 firmware/radeon/RS690_cp.bin.ihex           |   130 -
 firmware/radeon/RS780_me.bin.ihex           |  1345 ---
 firmware/radeon/RS780_pfp.bin.ihex          |   145 -
 firmware/radeon/RV610_me.bin.ihex           |  1345 ---
 firmware/radeon/RV610_pfp.bin.ihex          |   145 -
 firmware/radeon/RV620_me.bin.ihex           |  1345 ---
 firmware/radeon/RV620_pfp.bin.ihex          |   145 -
 firmware/radeon/RV630_me.bin.ihex           |  1345 ---
 firmware/radeon/RV630_pfp.bin.ihex          |   145 -
 firmware/radeon/RV635_me.bin.ihex           |  1345 ---
 firmware/radeon/RV635_pfp.bin.ihex          |   145 -
 firmware/radeon/RV670_me.bin.ihex           |  1345 ---
 firmware/radeon/RV670_pfp.bin.ihex          |   145 -
 firmware/radeon/RV710_me.bin.ihex           |   341 -
 firmware/radeon/RV710_pfp.bin.ihex          |   213 -
 firmware/radeon/RV730_me.bin.ihex           |   341 -
 firmware/radeon/RV730_pfp.bin.ihex          |   213 -
 firmware/radeon/RV770_me.bin.ihex           |   341 -
 firmware/radeon/RV770_pfp.bin.ihex          |   213 -
 firmware/sb16/alaw_main.csp.ihex            |    87 -
 firmware/sb16/ima_adpcm_capture.csp.ihex    |   121 -
 firmware/sb16/ima_adpcm_init.csp.ihex       |    70 -
 firmware/sb16/ima_adpcm_playback.csp.ihex   |   122 -
 firmware/sb16/mulaw_main.csp.ihex           |    84 -
 firmware/sun/cassini.bin.ihex               |   143 -
 firmware/tehuti/bdx.bin.ihex                |  2678 -----
 firmware/ti_3410.fw.ihex                    |   862 --
 firmware/ti_5052.fw.ihex                    |   862 --
 firmware/tigon/tg3.bin.ihex                 |   175 -
 firmware/tigon/tg3_tso.bin.ihex             |   446 -
 firmware/tigon/tg3_tso5.bin.ihex            |   252 -
 firmware/ttusb-budget/dspbootcode.bin.ihex  |   820 --
 firmware/vicam/firmware.H16                 |     7 -
 firmware/whiteheat.HEX                      |  1097 --
 firmware/whiteheat_loader.HEX               |   314 -
 firmware/whiteheat_loader_debug.HEX         |   403 -
 firmware/yam/1200.bin.ihex                  |   342 -
 firmware/yam/9600.bin.ihex                  |   342 -
 firmware/yamaha/ds1_ctrl.fw.ihex            |   769 --
 firmware/yamaha/ds1_dsp.fw.ihex             |     9 -
 firmware/yamaha/ds1e_ctrl.fw.ihex           |   769 --
 firmware/yamaha/yss225_registers.bin.ihex   |   998 --
 scripts/Makefile.fwinst                     |    70 -
 153 files changed, 1 insertion(+), 129170 deletions(-)
 delete mode 100644 firmware/.gitignore
 delete mode 100644 firmware/3com/typhoon.bin.ihex
 delete mode 100644 firmware/Makefile
 delete mode 100644 firmware/README.AddingFirmware
 delete mode 100644 firmware/WHENCE
 delete mode 100644 firmware/acenic/tg1.bin.ihex
 delete mode 100644 firmware/acenic/tg2.bin.ihex
 delete mode 100644 firmware/adaptec/starfire_rx.bin.ihex
 delete mode 100644 firmware/adaptec/starfire_tx.bin.ihex
 delete mode 100644 firmware/advansys/3550.bin.ihex
 delete mode 100644 firmware/advansys/38C0800.bin.ihex
 delete mode 100644 firmware/advansys/38C1600.bin.ihex
 delete mode 100644 firmware/advansys/mcode.bin.ihex
 delete mode 100644 firmware/atmsar11.HEX
 delete mode 100644 firmware/av7110/Boot.S
 delete mode 100644 firmware/av7110/bootcode.bin.ihex
 delete mode 100644 firmware/bnx2/bnx2-mips-06-6.2.1.fw.ihex
 delete mode 100644 firmware/bnx2/bnx2-mips-09-6.2.1a.fw.ihex
 delete mode 100644 firmware/bnx2/bnx2-rv2p-06-6.0.15.fw.ihex
 delete mode 100644 firmware/bnx2/bnx2-rv2p-09-6.0.17.fw.ihex
 delete mode 100644 firmware/bnx2/bnx2-rv2p-09ax-6.0.17.fw.ihex
 delete mode 100644 firmware/bnx2x/bnx2x-e1-6.2.9.0.fw.ihex
 delete mode 100644 firmware/bnx2x/bnx2x-e1h-6.2.9.0.fw.ihex
 delete mode 100644 firmware/bnx2x/bnx2x-e2-6.2.9.0.fw.ihex
 delete mode 100644 firmware/cis/.gitignore
 delete mode 100644 firmware/cis/3CCFEM556.cis.ihex
 delete mode 100644 firmware/cis/3CXEM556.cis.ihex
 delete mode 100644 firmware/cis/COMpad2.cis.ihex
 delete mode 100644 firmware/cis/COMpad4.cis.ihex
 delete mode 100644 firmware/cis/DP83903.cis.ihex
 delete mode 100644 firmware/cis/LA-PCM.cis.ihex
 delete mode 100644 firmware/cis/MT5634ZLX.cis.ihex
 delete mode 100644 firmware/cis/NE2K.cis.ihex
 delete mode 100644 firmware/cis/PCMLM28.cis.ihex
 delete mode 100644 firmware/cis/PE-200.cis.ihex
 delete mode 100644 firmware/cis/PE520.cis.ihex
 delete mode 100644 firmware/cis/RS-COM-2P.cis.ihex
 delete mode 100644 firmware/cis/SW_555_SER.cis.ihex
 delete mode 100644 firmware/cis/SW_7xx_SER.cis.ihex
 delete mode 100644 firmware/cis/SW_8xx_SER.cis.ihex
 delete mode 100644 firmware/cis/tamarack.cis.ihex
 delete mode 100644 firmware/cpia2/stv0672_vp4.bin.ihex
 delete mode 100644 firmware/cxgb3/ael2005_opt_edc.bin.ihex
 delete mode 100644 firmware/cxgb3/ael2005_twx_edc.bin.ihex
 delete mode 100644 firmware/cxgb3/ael2020_twx_edc.bin.ihex
 delete mode 100644 firmware/cxgb3/t3b_psram-1.1.0.bin.ihex
 delete mode 100644 firmware/cxgb3/t3c_psram-1.1.0.bin.ihex
 delete mode 100644 firmware/dsp56k/bootstrap.asm
 delete mode 100644 firmware/dsp56k/bootstrap.bin.ihex
 delete mode 100644 firmware/e100/d101m_ucode.bin.ihex
 delete mode 100644 firmware/e100/d101s_ucode.bin.ihex
 delete mode 100644 firmware/e100/d102e_ucode.bin.ihex
 delete mode 100644 firmware/edgeport/boot.H16
 delete mode 100644 firmware/edgeport/boot2.H16
 delete mode 100644 firmware/edgeport/down.H16
 delete mode 100644 firmware/edgeport/down2.H16
 delete mode 100644 firmware/edgeport/down3.bin.ihex
 delete mode 100644 firmware/emi26/bitstream.HEX
 delete mode 100644 firmware/emi26/firmware.HEX
 delete mode 100644 firmware/emi26/loader.HEX
 delete mode 100644 firmware/emi62/bitstream.HEX
 delete mode 100644 firmware/emi62/loader.HEX
 delete mode 100644 firmware/emi62/midi.HEX
 delete mode 100644 firmware/emi62/spdif.HEX
 delete mode 100644 firmware/ess/maestro3_assp_kernel.fw.ihex
 delete mode 100644 firmware/ess/maestro3_assp_minisrc.fw.ihex
 delete mode 100644 firmware/ihex2fw.c
 delete mode 100644 firmware/kaweth/new_code.bin.ihex
 delete mode 100644 firmware/kaweth/new_code_fix.bin.ihex
 delete mode 100644 firmware/kaweth/trigger_code.bin.ihex
 delete mode 100644 firmware/kaweth/trigger_code_fix.bin.ihex
 delete mode 100644 firmware/keyspan/mpr.HEX
 delete mode 100644 firmware/keyspan/usa18x.HEX
 delete mode 100644 firmware/keyspan/usa19.HEX
 delete mode 100644 firmware/keyspan/usa19qi.HEX
 delete mode 100644 firmware/keyspan/usa19qw.HEX
 delete mode 100644 firmware/keyspan/usa19w.HEX
 delete mode 100644 firmware/keyspan/usa28.HEX
 delete mode 100644 firmware/keyspan/usa28x.HEX
 delete mode 100644 firmware/keyspan/usa28xa.HEX
 delete mode 100644 firmware/keyspan/usa28xb.HEX
 delete mode 100644 firmware/keyspan/usa49w.HEX
 delete mode 100644 firmware/keyspan/usa49wlc.HEX
 delete mode 100644 firmware/keyspan_pda/keyspan_pda.HEX
 delete mode 100644 firmware/keyspan_pda/keyspan_pda.S
 delete mode 100644 firmware/keyspan_pda/xircom_pgs.HEX
 delete mode 100644 firmware/keyspan_pda/xircom_pgs.S
 delete mode 100644 firmware/korg/k1212.dsp.ihex
 delete mode 100644 firmware/matrox/g200_warp.H16
 delete mode 100644 firmware/matrox/g400_warp.H16
 delete mode 100644 firmware/mts_cdma.fw.ihex
 delete mode 100644 firmware/mts_edge.fw.ihex
 delete mode 100644 firmware/mts_gsm.fw.ihex
 delete mode 100644 firmware/myricom/lanai.bin.ihex
 delete mode 100644 firmware/ositech/Xilinx7OD.bin.ihex
 delete mode 100644 firmware/qlogic/1040.bin.ihex
 delete mode 100644 firmware/qlogic/12160.bin.ihex
 delete mode 100644 firmware/qlogic/1280.bin.ihex
 delete mode 100644 firmware/qlogic/isp1000.bin.ihex
 delete mode 100644 firmware/qlogic/sd7220.fw.ihex
 delete mode 100644 firmware/r128/r128_cce.bin.ihex
 delete mode 100644 firmware/radeon/R100_cp.bin.ihex
 delete mode 100644 firmware/radeon/R200_cp.bin.ihex
 delete mode 100644 firmware/radeon/R300_cp.bin.ihex
 delete mode 100644 firmware/radeon/R420_cp.bin.ihex
 delete mode 100644 firmware/radeon/R520_cp.bin.ihex
 delete mode 100644 firmware/radeon/R600_me.bin.ihex
 delete mode 100644 firmware/radeon/R600_pfp.bin.ihex
 delete mode 100644 firmware/radeon/RS600_cp.bin.ihex
 delete mode 100644 firmware/radeon/RS690_cp.bin.ihex
 delete mode 100644 firmware/radeon/RS780_me.bin.ihex
 delete mode 100644 firmware/radeon/RS780_pfp.bin.ihex
 delete mode 100644 firmware/radeon/RV610_me.bin.ihex
 delete mode 100644 firmware/radeon/RV610_pfp.bin.ihex
 delete mode 100644 firmware/radeon/RV620_me.bin.ihex
 delete mode 100644 firmware/radeon/RV620_pfp.bin.ihex
 delete mode 100644 firmware/radeon/RV630_me.bin.ihex
 delete mode 100644 firmware/radeon/RV630_pfp.bin.ihex
 delete mode 100644 firmware/radeon/RV635_me.bin.ihex
 delete mode 100644 firmware/radeon/RV635_pfp.bin.ihex
 delete mode 100644 firmware/radeon/RV670_me.bin.ihex
 delete mode 100644 firmware/radeon/RV670_pfp.bin.ihex
 delete mode 100644 firmware/radeon/RV710_me.bin.ihex
 delete mode 100644 firmware/radeon/RV710_pfp.bin.ihex
 delete mode 100644 firmware/radeon/RV730_me.bin.ihex
 delete mode 100644 firmware/radeon/RV730_pfp.bin.ihex
 delete mode 100644 firmware/radeon/RV770_me.bin.ihex
 delete mode 100644 firmware/radeon/RV770_pfp.bin.ihex
 delete mode 100644 firmware/sb16/alaw_main.csp.ihex
 delete mode 100644 firmware/sb16/ima_adpcm_capture.csp.ihex
 delete mode 100644 firmware/sb16/ima_adpcm_init.csp.ihex
 delete mode 100644 firmware/sb16/ima_adpcm_playback.csp.ihex
 delete mode 100644 firmware/sb16/mulaw_main.csp.ihex
 delete mode 100644 firmware/sun/cassini.bin.ihex
 delete mode 100644 firmware/tehuti/bdx.bin.ihex
 delete mode 100644 firmware/ti_3410.fw.ihex
 delete mode 100644 firmware/ti_5052.fw.ihex
 delete mode 100644 firmware/tigon/tg3.bin.ihex
 delete mode 100644 firmware/tigon/tg3_tso.bin.ihex
 delete mode 100644 firmware/tigon/tg3_tso5.bin.ihex
 delete mode 100644 firmware/ttusb-budget/dspbootcode.bin.ihex
 delete mode 100644 firmware/vicam/firmware.H16
 delete mode 100644 firmware/whiteheat.HEX
 delete mode 100644 firmware/whiteheat_loader.HEX
 delete mode 100644 firmware/whiteheat_loader_debug.HEX
 delete mode 100644 firmware/yam/1200.bin.ihex
 delete mode 100644 firmware/yam/9600.bin.ihex
 delete mode 100644 firmware/yamaha/ds1_ctrl.fw.ihex
 delete mode 100644 firmware/yamaha/ds1_dsp.fw.ihex
 delete mode 100644 firmware/yamaha/ds1e_ctrl.fw.ihex
 delete mode 100644 firmware/yamaha/yss225_registers.bin.ihex
 delete mode 100644 scripts/Makefile.fwinst

diff --git a/Makefile b/Makefile
index 6585339586a6..7e2ca4971a39 100644
--- a/Makefile
+++ b/Makefile
@@ -562,7 +562,7 @@ scripts: scripts_basic include/config/auto.conf include/config/tristate.conf \
 
 # Objects we will link into vmlinux / subdirs we need to visit
 init-y		:= init/
-drivers-y	:= drivers/ sound/ firmware/
+drivers-y	:= drivers/ sound/
 net-y		:= net/
 libs-y		:= lib/
 core-y		:= usr/
@@ -1128,16 +1128,6 @@ headerdep:
 	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
 	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
 
-# ---------------------------------------------------------------------------
-# Firmware install
-INSTALL_FW_PATH=$(INSTALL_MOD_PATH)/lib/firmware
-export INSTALL_FW_PATH
-
-PHONY += firmware_install
-firmware_install:
-	@mkdir -p $(objtree)/firmware
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.fwinst obj=firmware __fw_install
-
 # ---------------------------------------------------------------------------
 # Kernel headers
 
@@ -1216,7 +1206,6 @@ modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
 	$(Q)$(AWK) '!x[$$0]++' $(vmlinux-dirs:%=$(objtree)/%/modules.order) > $(objtree)/modules.order
 	@$(kecho) '  Building modules, stage 2.';
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.fwinst obj=firmware __fw_modbuild
 
 modules.builtin: $(vmlinux-dirs:%=%/modules.builtin)
 	$(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
@@ -1252,7 +1241,6 @@ _modinst_:
 # boot script depmod is the master version.
 PHONY += _modinst_post
 _modinst_post: _modinst_
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.fwinst obj=firmware __fw_modinst
 	$(call cmd,depmod)
 
 ifeq ($(CONFIG_MODULE_SIG), y)
@@ -1375,8 +1363,6 @@ help:
 	@echo  '* vmlinux	  - Build the bare kernel'
 	@echo  '* modules	  - Build all modules'
 	@echo  '  modules_install - Install all modules to INSTALL_MOD_PATH (default: /)'
-	@echo  '  firmware_install- Install all firmware to INSTALL_FW_PATH'
-	@echo  '                    (default: $$(INSTALL_MOD_PATH)/lib/firmware)'
 	@echo  '  dir/            - Build all files in dir and below'
 	@echo  '  dir/file.[ois]  - Build specified target only'
 	@echo  '  dir/file.ll     - Build the LLVM assembly file'
diff --git a/firmware/.gitignore b/firmware/.gitignore
deleted file mode 100644
index d9c69017bc9a..000000000000
diff --git a/firmware/3com/typhoon.bin.ihex b/firmware/3com/typhoon.bin.ihex
deleted file mode 100644
index d7a83bea0c3b..000000000000
diff --git a/firmware/Makefile b/firmware/Makefile
deleted file mode 100644
index fa3e81c2a97b..000000000000
diff --git a/firmware/README.AddingFirmware b/firmware/README.AddingFirmware
deleted file mode 100644
index bcb5f46aff83..000000000000
diff --git a/firmware/WHENCE b/firmware/WHENCE
deleted file mode 100644
index de6f22e008f1..000000000000
diff --git a/firmware/acenic/tg1.bin.ihex b/firmware/acenic/tg1.bin.ihex
deleted file mode 100644
index bef2659d3645..000000000000
diff --git a/firmware/acenic/tg2.bin.ihex b/firmware/acenic/tg2.bin.ihex
deleted file mode 100644
index a9ff4f431f22..000000000000
diff --git a/firmware/adaptec/starfire_rx.bin.ihex b/firmware/adaptec/starfire_rx.bin.ihex
deleted file mode 100644
index 6b1fae0d18eb..000000000000
diff --git a/firmware/adaptec/starfire_tx.bin.ihex b/firmware/adaptec/starfire_tx.bin.ihex
deleted file mode 100644
index 6b1fae0d18eb..000000000000
diff --git a/firmware/advansys/3550.bin.ihex b/firmware/advansys/3550.bin.ihex
deleted file mode 100644
index 6809b0d84e4f..000000000000
diff --git a/firmware/advansys/38C0800.bin.ihex b/firmware/advansys/38C0800.bin.ihex
deleted file mode 100644
index a60b447ff74a..000000000000
diff --git a/firmware/advansys/38C1600.bin.ihex b/firmware/advansys/38C1600.bin.ihex
deleted file mode 100644
index 18c7c4862046..000000000000
diff --git a/firmware/advansys/mcode.bin.ihex b/firmware/advansys/mcode.bin.ihex
deleted file mode 100644
index cd160d938667..000000000000
diff --git a/firmware/atmsar11.HEX b/firmware/atmsar11.HEX
deleted file mode 100644
index dfddc190ac24..000000000000
diff --git a/firmware/av7110/Boot.S b/firmware/av7110/Boot.S
deleted file mode 100644
index d562fdc2908f..000000000000
diff --git a/firmware/av7110/bootcode.bin.ihex b/firmware/av7110/bootcode.bin.ihex
deleted file mode 100644
index 26a2993e0723..000000000000
diff --git a/firmware/bnx2/bnx2-mips-06-6.2.1.fw.ihex b/firmware/bnx2/bnx2-mips-06-6.2.1.fw.ihex
deleted file mode 100644
index 4c43b26af0a6..000000000000
diff --git a/firmware/bnx2/bnx2-mips-09-6.2.1a.fw.ihex b/firmware/bnx2/bnx2-mips-09-6.2.1a.fw.ihex
deleted file mode 100644
index 05e710248d2c..000000000000
diff --git a/firmware/bnx2/bnx2-rv2p-06-6.0.15.fw.ihex b/firmware/bnx2/bnx2-rv2p-06-6.0.15.fw.ihex
deleted file mode 100644
index dcc443e210f5..000000000000
diff --git a/firmware/bnx2/bnx2-rv2p-09-6.0.17.fw.ihex b/firmware/bnx2/bnx2-rv2p-09-6.0.17.fw.ihex
deleted file mode 100644
index 435203d64305..000000000000
diff --git a/firmware/bnx2/bnx2-rv2p-09ax-6.0.17.fw.ihex b/firmware/bnx2/bnx2-rv2p-09ax-6.0.17.fw.ihex
deleted file mode 100644
index d2f275788f16..000000000000
diff --git a/firmware/bnx2x/bnx2x-e1-6.2.9.0.fw.ihex b/firmware/bnx2x/bnx2x-e1-6.2.9.0.fw.ihex
deleted file mode 100644
index 0ed7f5891184..000000000000
diff --git a/firmware/bnx2x/bnx2x-e1h-6.2.9.0.fw.ihex b/firmware/bnx2x/bnx2x-e1h-6.2.9.0.fw.ihex
deleted file mode 100644
index ba1ce53df1d8..000000000000
diff --git a/firmware/bnx2x/bnx2x-e2-6.2.9.0.fw.ihex b/firmware/bnx2x/bnx2x-e2-6.2.9.0.fw.ihex
deleted file mode 100644
index 8405e719e7fb..000000000000
diff --git a/firmware/cis/.gitignore b/firmware/cis/.gitignore
deleted file mode 100644
index 1de39847f261..000000000000
diff --git a/firmware/cis/3CCFEM556.cis.ihex b/firmware/cis/3CCFEM556.cis.ihex
deleted file mode 100644
index e4d92b173e17..000000000000
diff --git a/firmware/cis/3CXEM556.cis.ihex b/firmware/cis/3CXEM556.cis.ihex
deleted file mode 100644
index 895010b230ff..000000000000
diff --git a/firmware/cis/COMpad2.cis.ihex b/firmware/cis/COMpad2.cis.ihex
deleted file mode 100644
index 1671c5e48caa..000000000000
diff --git a/firmware/cis/COMpad4.cis.ihex b/firmware/cis/COMpad4.cis.ihex
deleted file mode 100644
index 27bbec1921b3..000000000000
diff --git a/firmware/cis/DP83903.cis.ihex b/firmware/cis/DP83903.cis.ihex
deleted file mode 100644
index 6d73ea3cf1b8..000000000000
diff --git a/firmware/cis/LA-PCM.cis.ihex b/firmware/cis/LA-PCM.cis.ihex
deleted file mode 100644
index a0ff0c7b393d..000000000000
diff --git a/firmware/cis/MT5634ZLX.cis.ihex b/firmware/cis/MT5634ZLX.cis.ihex
deleted file mode 100644
index 72500b9d95d8..000000000000
diff --git a/firmware/cis/NE2K.cis.ihex b/firmware/cis/NE2K.cis.ihex
deleted file mode 100644
index 1bb40fc4759f..000000000000
diff --git a/firmware/cis/PCMLM28.cis.ihex b/firmware/cis/PCMLM28.cis.ihex
deleted file mode 100644
index ffdfe8522ef5..000000000000
diff --git a/firmware/cis/PE-200.cis.ihex b/firmware/cis/PE-200.cis.ihex
deleted file mode 100644
index e6dbdab6eb79..000000000000
diff --git a/firmware/cis/PE520.cis.ihex b/firmware/cis/PE520.cis.ihex
deleted file mode 100644
index 97a745b5496e..000000000000
diff --git a/firmware/cis/RS-COM-2P.cis.ihex b/firmware/cis/RS-COM-2P.cis.ihex
deleted file mode 100644
index 0801ca5da80a..000000000000
diff --git a/firmware/cis/SW_555_SER.cis.ihex b/firmware/cis/SW_555_SER.cis.ihex
deleted file mode 100644
index 9b9348acee7b..000000000000
diff --git a/firmware/cis/SW_7xx_SER.cis.ihex b/firmware/cis/SW_7xx_SER.cis.ihex
deleted file mode 100644
index 11e44ad86437..000000000000
diff --git a/firmware/cis/SW_8xx_SER.cis.ihex b/firmware/cis/SW_8xx_SER.cis.ihex
deleted file mode 100644
index bbcfe6348328..000000000000
diff --git a/firmware/cis/tamarack.cis.ihex b/firmware/cis/tamarack.cis.ihex
deleted file mode 100644
index 1e86547fb361..000000000000
diff --git a/firmware/cpia2/stv0672_vp4.bin.ihex b/firmware/cpia2/stv0672_vp4.bin.ihex
deleted file mode 100644
index bd0b9cf65640..000000000000
diff --git a/firmware/cxgb3/ael2005_opt_edc.bin.ihex b/firmware/cxgb3/ael2005_opt_edc.bin.ihex
deleted file mode 100644
index c1d6e5d3bea7..000000000000
diff --git a/firmware/cxgb3/ael2005_twx_edc.bin.ihex b/firmware/cxgb3/ael2005_twx_edc.bin.ihex
deleted file mode 100644
index 9b5e9e51fcb7..000000000000
diff --git a/firmware/cxgb3/ael2020_twx_edc.bin.ihex b/firmware/cxgb3/ael2020_twx_edc.bin.ihex
deleted file mode 100644
index 8b1337f4c329..000000000000
diff --git a/firmware/cxgb3/t3b_psram-1.1.0.bin.ihex b/firmware/cxgb3/t3b_psram-1.1.0.bin.ihex
deleted file mode 100644
index 140893005171..000000000000
diff --git a/firmware/cxgb3/t3c_psram-1.1.0.bin.ihex b/firmware/cxgb3/t3c_psram-1.1.0.bin.ihex
deleted file mode 100644
index c6504803852f..000000000000
diff --git a/firmware/dsp56k/bootstrap.asm b/firmware/dsp56k/bootstrap.asm
deleted file mode 100644
index a411047e6db3..000000000000
diff --git a/firmware/dsp56k/bootstrap.bin.ihex b/firmware/dsp56k/bootstrap.bin.ihex
deleted file mode 100644
index 233f21fe72b0..000000000000
diff --git a/firmware/e100/d101m_ucode.bin.ihex b/firmware/e100/d101m_ucode.bin.ihex
deleted file mode 100644
index 12971ed458a6..000000000000
diff --git a/firmware/e100/d101s_ucode.bin.ihex b/firmware/e100/d101s_ucode.bin.ihex
deleted file mode 100644
index 102c7feb666e..000000000000
diff --git a/firmware/e100/d102e_ucode.bin.ihex b/firmware/e100/d102e_ucode.bin.ihex
deleted file mode 100644
index 9e806da854de..000000000000
diff --git a/firmware/edgeport/boot.H16 b/firmware/edgeport/boot.H16
deleted file mode 100644
index 4bf8e91a975a..000000000000
diff --git a/firmware/edgeport/boot2.H16 b/firmware/edgeport/boot2.H16
deleted file mode 100644
index 8b14295e1f3e..000000000000
diff --git a/firmware/edgeport/down.H16 b/firmware/edgeport/down.H16
deleted file mode 100644
index 7e36fe1f2182..000000000000
diff --git a/firmware/edgeport/down2.H16 b/firmware/edgeport/down2.H16
deleted file mode 100644
index 2f4b4ff3ab7b..000000000000
diff --git a/firmware/edgeport/down3.bin.ihex b/firmware/edgeport/down3.bin.ihex
deleted file mode 100644
index 7935e520878a..000000000000
diff --git a/firmware/emi26/bitstream.HEX b/firmware/emi26/bitstream.HEX
deleted file mode 100644
index 044d3f664385..000000000000
diff --git a/firmware/emi26/firmware.HEX b/firmware/emi26/firmware.HEX
deleted file mode 100644
index 1ca400eb1413..000000000000
diff --git a/firmware/emi26/loader.HEX b/firmware/emi26/loader.HEX
deleted file mode 100644
index 77c439f6565b..000000000000
diff --git a/firmware/emi62/bitstream.HEX b/firmware/emi62/bitstream.HEX
deleted file mode 100644
index a0f4f570f076..000000000000
diff --git a/firmware/emi62/loader.HEX b/firmware/emi62/loader.HEX
deleted file mode 100644
index 0edb2dc310eb..000000000000
diff --git a/firmware/emi62/midi.HEX b/firmware/emi62/midi.HEX
deleted file mode 100644
index 32a0d65176ba..000000000000
diff --git a/firmware/emi62/spdif.HEX b/firmware/emi62/spdif.HEX
deleted file mode 100644
index 322d50c9cf4d..000000000000
diff --git a/firmware/ess/maestro3_assp_kernel.fw.ihex b/firmware/ess/maestro3_assp_kernel.fw.ihex
deleted file mode 100644
index 933c4c375c2f..000000000000
diff --git a/firmware/ess/maestro3_assp_minisrc.fw.ihex b/firmware/ess/maestro3_assp_minisrc.fw.ihex
deleted file mode 100644
index d2c0031dadf2..000000000000
diff --git a/firmware/ihex2fw.c b/firmware/ihex2fw.c
deleted file mode 100644
index 08d90e25abf0..000000000000
diff --git a/firmware/kaweth/new_code.bin.ihex b/firmware/kaweth/new_code.bin.ihex
deleted file mode 100644
index 292d40f4f334..000000000000
diff --git a/firmware/kaweth/new_code_fix.bin.ihex b/firmware/kaweth/new_code_fix.bin.ihex
deleted file mode 100644
index fb35d3d0c924..000000000000
diff --git a/firmware/kaweth/trigger_code.bin.ihex b/firmware/kaweth/trigger_code.bin.ihex
deleted file mode 100644
index c3e1658c2803..000000000000
diff --git a/firmware/kaweth/trigger_code_fix.bin.ihex b/firmware/kaweth/trigger_code_fix.bin.ihex
deleted file mode 100644
index 7712f73faeda..000000000000
diff --git a/firmware/keyspan/mpr.HEX b/firmware/keyspan/mpr.HEX
deleted file mode 100644
index a53ba10b2358..000000000000
diff --git a/firmware/keyspan/usa18x.HEX b/firmware/keyspan/usa18x.HEX
deleted file mode 100644
index a9ff70eadfe7..000000000000
diff --git a/firmware/keyspan/usa19.HEX b/firmware/keyspan/usa19.HEX
deleted file mode 100644
index c5d1496e8714..000000000000
diff --git a/firmware/keyspan/usa19qi.HEX b/firmware/keyspan/usa19qi.HEX
deleted file mode 100644
index 353bfcfefb9c..000000000000
diff --git a/firmware/keyspan/usa19qw.HEX b/firmware/keyspan/usa19qw.HEX
deleted file mode 100644
index 8a891023bf51..000000000000
diff --git a/firmware/keyspan/usa19w.HEX b/firmware/keyspan/usa19w.HEX
deleted file mode 100644
index a3b84313f2ca..000000000000
diff --git a/firmware/keyspan/usa28.HEX b/firmware/keyspan/usa28.HEX
deleted file mode 100644
index 000c97863c01..000000000000
diff --git a/firmware/keyspan/usa28x.HEX b/firmware/keyspan/usa28x.HEX
deleted file mode 100644
index 9f0f7fac7609..000000000000
diff --git a/firmware/keyspan/usa28xa.HEX b/firmware/keyspan/usa28xa.HEX
deleted file mode 100644
index f14932efbafb..000000000000
diff --git a/firmware/keyspan/usa28xb.HEX b/firmware/keyspan/usa28xb.HEX
deleted file mode 100644
index 07cb708f1956..000000000000
diff --git a/firmware/keyspan/usa49w.HEX b/firmware/keyspan/usa49w.HEX
deleted file mode 100644
index 5e5b3d13dd5f..000000000000
diff --git a/firmware/keyspan/usa49wlc.HEX b/firmware/keyspan/usa49wlc.HEX
deleted file mode 100644
index 8406eb1bf373..000000000000
diff --git a/firmware/keyspan_pda/keyspan_pda.HEX b/firmware/keyspan_pda/keyspan_pda.HEX
deleted file mode 100644
index 6fcf02bb4b2d..000000000000
diff --git a/firmware/keyspan_pda/keyspan_pda.S b/firmware/keyspan_pda/keyspan_pda.S
deleted file mode 100644
index f3acc197a5ef..000000000000
diff --git a/firmware/keyspan_pda/xircom_pgs.HEX b/firmware/keyspan_pda/xircom_pgs.HEX
deleted file mode 100644
index e9b00d70282f..000000000000
diff --git a/firmware/keyspan_pda/xircom_pgs.S b/firmware/keyspan_pda/xircom_pgs.S
deleted file mode 100644
index 0b79bbf0ae15..000000000000
diff --git a/firmware/korg/k1212.dsp.ihex b/firmware/korg/k1212.dsp.ihex
deleted file mode 100644
index b151997b380c..000000000000
diff --git a/firmware/matrox/g200_warp.H16 b/firmware/matrox/g200_warp.H16
deleted file mode 100644
index 5064b6f01bb4..000000000000
diff --git a/firmware/matrox/g400_warp.H16 b/firmware/matrox/g400_warp.H16
deleted file mode 100644
index b432d1074d8d..000000000000
diff --git a/firmware/mts_cdma.fw.ihex b/firmware/mts_cdma.fw.ihex
deleted file mode 100644
index f6ad0cbd30cb..000000000000
diff --git a/firmware/mts_edge.fw.ihex b/firmware/mts_edge.fw.ihex
deleted file mode 100644
index d14ebd647846..000000000000
diff --git a/firmware/mts_gsm.fw.ihex b/firmware/mts_gsm.fw.ihex
deleted file mode 100644
index f6ad0cbd30cb..000000000000
diff --git a/firmware/myricom/lanai.bin.ihex b/firmware/myricom/lanai.bin.ihex
deleted file mode 100644
index bf47f4c74940..000000000000
diff --git a/firmware/ositech/Xilinx7OD.bin.ihex b/firmware/ositech/Xilinx7OD.bin.ihex
deleted file mode 100644
index 03e80857a549..000000000000
diff --git a/firmware/qlogic/1040.bin.ihex b/firmware/qlogic/1040.bin.ihex
deleted file mode 100644
index d1213307f713..000000000000
diff --git a/firmware/qlogic/12160.bin.ihex b/firmware/qlogic/12160.bin.ihex
deleted file mode 100644
index dc800ecdaf3a..000000000000
diff --git a/firmware/qlogic/1280.bin.ihex b/firmware/qlogic/1280.bin.ihex
deleted file mode 100644
index 612c2633f8cd..000000000000
diff --git a/firmware/qlogic/isp1000.bin.ihex b/firmware/qlogic/isp1000.bin.ihex
deleted file mode 100644
index a5c242cda220..000000000000
diff --git a/firmware/qlogic/sd7220.fw.ihex b/firmware/qlogic/sd7220.fw.ihex
deleted file mode 100644
index a33636319112..000000000000
diff --git a/firmware/r128/r128_cce.bin.ihex b/firmware/r128/r128_cce.bin.ihex
deleted file mode 100644
index 4831315d7b99..000000000000
diff --git a/firmware/radeon/R100_cp.bin.ihex b/firmware/radeon/R100_cp.bin.ihex
deleted file mode 100644
index 151647b04fc4..000000000000
diff --git a/firmware/radeon/R200_cp.bin.ihex b/firmware/radeon/R200_cp.bin.ihex
deleted file mode 100644
index 3a0bd73111c4..000000000000
diff --git a/firmware/radeon/R300_cp.bin.ihex b/firmware/radeon/R300_cp.bin.ihex
deleted file mode 100644
index d307d56882c9..000000000000
diff --git a/firmware/radeon/R420_cp.bin.ihex b/firmware/radeon/R420_cp.bin.ihex
deleted file mode 100644
index 3815891275f9..000000000000
diff --git a/firmware/radeon/R520_cp.bin.ihex b/firmware/radeon/R520_cp.bin.ihex
deleted file mode 100644
index 372ff82a0143..000000000000
diff --git a/firmware/radeon/R600_me.bin.ihex b/firmware/radeon/R600_me.bin.ihex
deleted file mode 100644
index 30d4c14a308d..000000000000
diff --git a/firmware/radeon/R600_pfp.bin.ihex b/firmware/radeon/R600_pfp.bin.ihex
deleted file mode 100644
index 52361086c280..000000000000
diff --git a/firmware/radeon/RS600_cp.bin.ihex b/firmware/radeon/RS600_cp.bin.ihex
deleted file mode 100644
index 4a895016aca4..000000000000
diff --git a/firmware/radeon/RS690_cp.bin.ihex b/firmware/radeon/RS690_cp.bin.ihex
deleted file mode 100644
index 689627441d8b..000000000000
diff --git a/firmware/radeon/RS780_me.bin.ihex b/firmware/radeon/RS780_me.bin.ihex
deleted file mode 100644
index 6479c106b91f..000000000000
diff --git a/firmware/radeon/RS780_pfp.bin.ihex b/firmware/radeon/RS780_pfp.bin.ihex
deleted file mode 100644
index 40880411e785..000000000000
diff --git a/firmware/radeon/RV610_me.bin.ihex b/firmware/radeon/RV610_me.bin.ihex
deleted file mode 100644
index ba19ed892920..000000000000
diff --git a/firmware/radeon/RV610_pfp.bin.ihex b/firmware/radeon/RV610_pfp.bin.ihex
deleted file mode 100644
index f55292c97b79..000000000000
diff --git a/firmware/radeon/RV620_me.bin.ihex b/firmware/radeon/RV620_me.bin.ihex
deleted file mode 100644
index ba19ed892920..000000000000
diff --git a/firmware/radeon/RV620_pfp.bin.ihex b/firmware/radeon/RV620_pfp.bin.ihex
deleted file mode 100644
index f55292c97b79..000000000000
diff --git a/firmware/radeon/RV630_me.bin.ihex b/firmware/radeon/RV630_me.bin.ihex
deleted file mode 100644
index ba3a7e632d97..000000000000
diff --git a/firmware/radeon/RV630_pfp.bin.ihex b/firmware/radeon/RV630_pfp.bin.ihex
deleted file mode 100644
index f55292c97b79..000000000000
diff --git a/firmware/radeon/RV635_me.bin.ihex b/firmware/radeon/RV635_me.bin.ihex
deleted file mode 100644
index ba3a7e632d97..000000000000
diff --git a/firmware/radeon/RV635_pfp.bin.ihex b/firmware/radeon/RV635_pfp.bin.ihex
deleted file mode 100644
index f55292c97b79..000000000000
diff --git a/firmware/radeon/RV670_me.bin.ihex b/firmware/radeon/RV670_me.bin.ihex
deleted file mode 100644
index 9fbfc0e4438c..000000000000
diff --git a/firmware/radeon/RV670_pfp.bin.ihex b/firmware/radeon/RV670_pfp.bin.ihex
deleted file mode 100644
index f55292c97b79..000000000000
diff --git a/firmware/radeon/RV710_me.bin.ihex b/firmware/radeon/RV710_me.bin.ihex
deleted file mode 100644
index 5cdfe306eea5..000000000000
diff --git a/firmware/radeon/RV710_pfp.bin.ihex b/firmware/radeon/RV710_pfp.bin.ihex
deleted file mode 100644
index 3d811ff0a1a8..000000000000
diff --git a/firmware/radeon/RV730_me.bin.ihex b/firmware/radeon/RV730_me.bin.ihex
deleted file mode 100644
index 390c18e7cef3..000000000000
diff --git a/firmware/radeon/RV730_pfp.bin.ihex b/firmware/radeon/RV730_pfp.bin.ihex
deleted file mode 100644
index 3d811ff0a1a8..000000000000
diff --git a/firmware/radeon/RV770_me.bin.ihex b/firmware/radeon/RV770_me.bin.ihex
deleted file mode 100644
index a0e16990a20a..000000000000
diff --git a/firmware/radeon/RV770_pfp.bin.ihex b/firmware/radeon/RV770_pfp.bin.ihex
deleted file mode 100644
index a2d1619107de..000000000000
diff --git a/firmware/sb16/alaw_main.csp.ihex b/firmware/sb16/alaw_main.csp.ihex
deleted file mode 100644
index 04502707c42a..000000000000
diff --git a/firmware/sb16/ima_adpcm_capture.csp.ihex b/firmware/sb16/ima_adpcm_capture.csp.ihex
deleted file mode 100644
index 9a50a58564ae..000000000000
diff --git a/firmware/sb16/ima_adpcm_init.csp.ihex b/firmware/sb16/ima_adpcm_init.csp.ihex
deleted file mode 100644
index a899a9e743f4..000000000000
diff --git a/firmware/sb16/ima_adpcm_playback.csp.ihex b/firmware/sb16/ima_adpcm_playback.csp.ihex
deleted file mode 100644
index f09f18cf35e2..000000000000
diff --git a/firmware/sb16/mulaw_main.csp.ihex b/firmware/sb16/mulaw_main.csp.ihex
deleted file mode 100644
index b64b565f2296..000000000000
diff --git a/firmware/sun/cassini.bin.ihex b/firmware/sun/cassini.bin.ihex
deleted file mode 100644
index 5cd7ae70e71f..000000000000
diff --git a/firmware/tehuti/bdx.bin.ihex b/firmware/tehuti/bdx.bin.ihex
deleted file mode 100644
index b029e4c85795..000000000000
diff --git a/firmware/ti_3410.fw.ihex b/firmware/ti_3410.fw.ihex
deleted file mode 100644
index b22c0425980e..000000000000
diff --git a/firmware/ti_5052.fw.ihex b/firmware/ti_5052.fw.ihex
deleted file mode 100644
index b529e07cd6ec..000000000000
diff --git a/firmware/tigon/tg3.bin.ihex b/firmware/tigon/tg3.bin.ihex
deleted file mode 100644
index d842d7cc91b5..000000000000
diff --git a/firmware/tigon/tg3_tso.bin.ihex b/firmware/tigon/tg3_tso.bin.ihex
deleted file mode 100644
index f10c4ef90513..000000000000
diff --git a/firmware/tigon/tg3_tso5.bin.ihex b/firmware/tigon/tg3_tso5.bin.ihex
deleted file mode 100644
index 33672514eab3..000000000000
diff --git a/firmware/ttusb-budget/dspbootcode.bin.ihex b/firmware/ttusb-budget/dspbootcode.bin.ihex
deleted file mode 100644
index b4b2247077c4..000000000000
diff --git a/firmware/vicam/firmware.H16 b/firmware/vicam/firmware.H16
deleted file mode 100644
index cac0cba68cc7..000000000000
diff --git a/firmware/whiteheat.HEX b/firmware/whiteheat.HEX
deleted file mode 100644
index 8dae60295d55..000000000000
diff --git a/firmware/whiteheat_loader.HEX b/firmware/whiteheat_loader.HEX
deleted file mode 100644
index 5f663f6a2849..000000000000
diff --git a/firmware/whiteheat_loader_debug.HEX b/firmware/whiteheat_loader_debug.HEX
deleted file mode 100644
index 5633d588613e..000000000000
diff --git a/firmware/yam/1200.bin.ihex b/firmware/yam/1200.bin.ihex
deleted file mode 100644
index 9d34e5680e38..000000000000
diff --git a/firmware/yam/9600.bin.ihex b/firmware/yam/9600.bin.ihex
deleted file mode 100644
index 817a34be22cc..000000000000
diff --git a/firmware/yamaha/ds1_ctrl.fw.ihex b/firmware/yamaha/ds1_ctrl.fw.ihex
deleted file mode 100644
index aa9b1d7dcb0b..000000000000
diff --git a/firmware/yamaha/ds1_dsp.fw.ihex b/firmware/yamaha/ds1_dsp.fw.ihex
deleted file mode 100644
index acb0ba48f112..000000000000
diff --git a/firmware/yamaha/ds1e_ctrl.fw.ihex b/firmware/yamaha/ds1e_ctrl.fw.ihex
deleted file mode 100644
index 597f429ee31a..000000000000
diff --git a/firmware/yamaha/yss225_registers.bin.ihex b/firmware/yamaha/yss225_registers.bin.ihex
deleted file mode 100644
index 6dd3d8c4de2b..000000000000
diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
deleted file mode 100644
index b27290035253..000000000000
-- 
2.14.1

