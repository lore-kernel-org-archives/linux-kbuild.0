Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34858 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750804AbbCSDby (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2015 23:31:54 -0400
Message-ID: <550A4326.2070801@gmail.com>
Date: Wed, 18 Mar 2015 20:31:50 -0700
From: Frank Rowand <frowand.list@gmail.com>
Reply-To: frowand.list@gmail.com
MIME-Version: 1.0
Subject: [patch 1/7] dt: dtb version: consolidate documentation of chosen
 node bindings
References: <550A42AC.8060104@gmail.com>
In-Reply-To: <550A42AC.8060104@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Russell King <linux@arm.linux.org.uk>, Michal Marek <mmarek@suse.cz>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Leif Lindholm <leif.lindholm@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>

From: Frank Rowand <frank.rowand@sonymobile.com>

Documentation of bindings in node /chosen are scattered in several bindings
files.  If not already in Documentation/devicetree/bindings/chosen.txt, add
a pointer in that file to where the property and node bindings are described.

This is a clean up in anticipation of adding another node binding in /chosen.

Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
---
 Documentation/devicetree/bindings/chosen.txt |   31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

Index: b/Documentation/devicetree/bindings/chosen.txt
===================================================================
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -44,3 +44,34 @@ Implementation note: Linux will look for
 on PowerPC "stdout" if "stdout-path" is not found.  However, the
 "linux,stdout-path" and "stdout" properties are deprecated. New platforms
 should only use the "stdout-path" property.
+
+
+Properties documented in other bindings
+---------------------------------------
+#address-cells                          video/simple-framebuffer-sunxi.txt
+
+#size-cells                             video/simple-framebuffer-sunxi.txt
+
+bootargs                                booting-without-of.txt
+                                        usage-model.txt
+
+initrd-end                              usage-model.txt
+initrd-start                            usage-model.txt
+
+interrupt-controller (obsolete)         booting-without-of.txt
+
+linux,pci-probe-only                    pci/host-generic-pci.txt
+
+linux,stdout-path                       booting-without-of.txt
+
+ranges                                  video/simple-framebuffer-sunxi.txt
+
+stdout-path                             video/simple-framebuffer.txt
+
+
+Nodes documented in other bindings
+----------------------------------
+framebuffer                             video/simple-framebuffer.txt
+                                        video/simple-framebuffer-sunxi.txt
+
+linux,sysrq-reset-seq                   input/input-reset.txt
