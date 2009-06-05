Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.177]:57689 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751226AbZFEMbw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 08:31:52 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch] kbuild: fix headers_check.pl
Date: Fri, 5 Jun 2009 13:31:14 +0100
References: <20090605021419.7905.89870.sendpatchset@localhost.localdomain> <200906051021.51726.arnd@arndb.de> <4A28F1CD.6040804@redhat.com>
In-Reply-To: <4A28F1CD.6040804@redhat.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200906051331.14978.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Amerigo Wang <amwang@redhat.com>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Friday 05 June 2009, Amerigo Wang wrote:
> 
> >
> > I don't think we really need that distinction here, the old
> > text applies to both.
>
> Even for function declarations?

Yes. Any use of 'extern' in a kernel header file by definition
refers to a symbol that is defined in the kernel and therefore
not accessibly in user space. It is the same problem for
variables and functions, with the complication that leaving
out the 'extern' statement on a function declaration will
hide it from this check, while leaving it out on a variable
declaration turns it into a definition.

	Arnd <><
