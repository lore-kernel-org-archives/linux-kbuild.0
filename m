Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4626 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727940AbgFVMpD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jun 2020 08:45:03 -0400
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
Subject: [PATCH] docs: kbuild: fix ReST formatting
Date: Mon, 22 Jun 2020 12:43:43 +0000
Message-Id: <20200622124343.121043-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Dov Murik <dovmurik@linux.vnet.ibm.com>

Commit cd238effefa2 ("docs: kbuild: convert docs to ReST and rename to
*.rst") missed a ReST header and a verbatim file content area.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 Documentation/kbuild/modules.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index a45cccff467d..85ccc878895e 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -182,7 +182,8 @@ module 8123.ko, which is built from the following files::
 	8123_pci.c
 	8123_bin.o_shipped	<= Binary blob
 
---- 3.1 Shared Makefile
+3.1 Shared Makefile
+-------------------
 
 	An external module always includes a wrapper makefile that
 	supports building the module using "make" with no arguments.
@@ -470,9 +471,9 @@ build.
 
 	The syntax of the Module.symvers file is::
 
-	<CRC>       <Symbol>         <Module>                         <Export Type>     <Namespace>
+		<CRC>       <Symbol>         <Module>                         <Export Type>     <Namespace>
 
-	0xe1cc2a05  usb_stor_suspend drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL USB_STORAGE
+		0xe1cc2a05  usb_stor_suspend drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL USB_STORAGE
 
 	The fields are separated by tabs and values may be empty (e.g.
 	if no namespace is defined for an exported symbol).

base-commit: b103c607654e55dcb1da40557628a2044b72c936
-- 
2.20.1
