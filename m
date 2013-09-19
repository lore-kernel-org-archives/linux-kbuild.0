Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bsmtp4.bon.at ([195.3.86.186]:64027 "EHLO lbmfmo03.bon.at"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752602Ab3ISUQa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Sep 2013 16:16:30 -0400
Message-ID: <523B555E.2070508@kdbg.org>
Date: Thu, 19 Sep 2013 21:49:50 +0200
From: Johannes Sixt <j6t@kdbg.org>
MIME-Version: 1.0
Subject: Re: git issue / [PATCH] MIPS: fix invalid symbolic link file
References: <1379596148-32520-1-git-send-email-maddy@linux.vnet.ibm.com> <20130919133920.GA22468@linux-mips.org>
In-Reply-To: <20130919133920.GA22468@linux-mips.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, git@vger.kernel.org, steven.hill@imgtec.com, mmarek@suse.cz, swarren@nvidia.com, linux-mips@linux-mips.org, linux-kbuild@vger.kernel.org, james.hogan@imgtec.com

Am 19.09.2013 15:39, schrieb Ralf Baechle:
> The original patch that introduced the symlink with the \n is kernel
> commit 3b29aa5ba204c62b3ec8f9f5b1ebd6e5d74f75d3 and is archived in
> patchwork at http://patchwork.linux-mips.org/patch/5745/  The patch
> file contains a \n at the end - but one would expect that from a
> patch file that has been transfered via email, so I'm not sure how this
> is supposed to work with emailed patches?!?

The mbox file I downloaded from this link looks like this:


arch/mips/boot/dts/include/dt-bindings | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 arch/mips/boot/dts/include/dt-bindings

\ No newline at end of file

diff --git a/.../include/dt-bindings b/.../include/dt-bindings
new file mode 120000
index 0000000..08c00e4
--- /dev/null
+++ b/arch/mips/boot/dts/include/dt-bindings
@@ -0,0 +1 @@
+../../../../../include/dt-bindings


but it should look like this:


arch/mips/boot/dts/include/dt-bindings | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 arch/mips/boot/dts/include/dt-bindings

diff --git a/.../include/dt-bindings b/.../include/dt-bindings
new file mode 120000
index 0000000..08c00e4
--- /dev/null
+++ b/arch/mips/boot/dts/include/dt-bindings
@@ -0,0 +1 @@
+../../../../../include/dt-bindings
\ No newline at end of file


Whoever or whatever moved the '\ No newline at end of file' line above
the patch text is to blame.

-- Hannes

