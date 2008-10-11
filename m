Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fsuj28a.rz.uni-jena.de ([141.35.1.24]:40812 "EHLO
	fsuj28a.rz.uni-jena.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774AbYJKGdq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Oct 2008 02:33:46 -0400
Received: from schnapphans2.rz.uni-jena.de (schnappzu.uni-jena.de [141.35.1.25])
	by fsuj28a.rz.uni-jena.de (8.12.11/8.12.11) with SMTP id m9B6KCg6014823
	for <linux-kbuild@vger.kernel.org>; Sat, 11 Oct 2008 08:20:12 +0200
Received: from olaf.iswbio.uni-jena.de (olaf.iswbio.uni-jena.de [141.35.118.64])
	by smtp2.uni-jena.de (8.13.1/8.13.1) with ESMTP id m9B6KCXI028103
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <linux-kbuild@vger.kernel.org>; Sat, 11 Oct 2008 08:20:12 +0200
Received: from olaf by olaf.iswbio.uni-jena.de with local (Exim 4.63)
	(envelope-from <olaf.till@uni-jena.de>)
	id 1KoXqO-0002ti-4y
	for linux-kbuild@vger.kernel.org; Sat, 11 Oct 2008 08:20:52 +0200
Date: Sat, 11 Oct 2008 08:20:52 +0200
Subject: symbol versioning, interdependent external modules
Message-ID: <20081011062052.GA11116@till>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: Olaf Till <olaf.till@uni-jena.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I am no kernel developer, but would like to fix the build system of
certain third party external kernel modules (under GPL). Although they
use the linux makefiles, there are problems with symbol versioning.

The external packages build system, as usual, has a main Makefile
which causes recursive calls of 'make' in each subdirectory. There are
two modules in the package, built in different subdirectories, whose
Makefiles each cause a call of 'make' with the Makefile of linux for
building the modules.

Problem (on kernel linux-2.6.24-486, also on linux-2.6.18-686, both
from current Debian Stable): When the second module is built, the
linux modpost program reads 'Module.symvers' files only from the
second modules directory and from the linux source directory. The
second module uses symbols exported by the first module, but their
versions are in 'Module.symvers' in the directory of the first module,
so they are not read by modpost in this step. Consequently, modpost
warns about undefined symbols and produces a <modulename>.mod.c file
lacking these symbols; after linking, inserting the module taints the
kernel. I can work around the problem by copying 'Module.symvers' from
the first modules directory into the second modules directory and
building again.

How is such a situation (modules built in different directories,
second depends on the first) supposed to be handled correctly?

Olaf
