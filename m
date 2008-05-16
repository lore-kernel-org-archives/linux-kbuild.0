Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:52508 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751131AbYEPQC7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 May 2008 12:02:59 -0400
Date: Fri, 16 May 2008 09:02:49 -0700
From: Joel Becker <Joel.Becker@oracle.com>
Subject: Re: Kbuild Makefile output
Message-ID: <20080516160249.GB499@mail.oracle.com>
References: <20080516093243.GA499@mail.oracle.com> <114572.24054.qm@web95110.mail.in2.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <114572.24054.qm@web95110.mail.in2.yahoo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: murtuja bharmal <murtuja_bharmal@yahoo.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, May 16, 2008 at 12:36:30PM +0100, murtuja bharmal wrote:
> Actaually foo.c is common file for kernel space and
> user space and bar.c is only a part of kernel space.
> Anyway if we can change object file name for all
> source file without changing source file name, then
> also no issue but I just want to know whether it is
> possible or not.

	In general, kbuild wants to find a source file with the same
name as the object file.  That you can't change.  It also expects to
build object files in the same directory as their source files.  This is
why I suggested a special directory where you symlink all the required
sources for a kernel build, then let kbuild do the rest.
	To sum up - pick the names you want for the files in a kernel
build.  Set them in mymodule-objs.  Then if those names are different
than your actual source file, come up with a rule to change the name.

Joel

-- 

"It is not the function of our government to keep the citizen from
 falling into error; it is the function of the citizen to keep the
 government from falling into error."
	- Robert H. Jackson

Joel Becker
Principal Software Developer
Oracle
E-mail: joel.becker@oracle.com
Phone: (650) 506-8127
