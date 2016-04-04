Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42635 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752875AbcDDTV7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Apr 2016 15:21:59 -0400
Subject: Re: Example 3 inclusion, Documentation/kbuild/modules.txt:250
References: <20160404004140.GA10001@linuxfoundation.org>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5702BED4.6070705@suse.com>
Date: Mon, 4 Apr 2016 21:21:56 +0200
MIME-Version: 1.0
In-Reply-To: <20160404004140.GA10001@linuxfoundation.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "C.J. Collier KF7BMP" <cjcollier@linuxfoundation.org>
Cc: linux-kbuild@vger.kernel.org

Dne 4.4.2016 v 02:41 C.J. Collier KF7BMP napsal(a):
> Hello Michal and kbuild team,
> 
> I think I've spotted an error in the module KBuild / Makefile
> documentation.  I believe that the first condition should be executed
> only if KERNELRELEASE is unset, and the rest should be executed
> unconditionally.  Let me know if I'm misreading it.

The second part is there for the sake of convenience, so that one can
type 'make' in the external module directory and it will try to compile
it against the running kernel. It is not something kbuild needs to see.

Also, please follow Documentation/SubmittingPatches and add your signoff
to patches you send. And ideally send the patch inline.

Thanks,
Michal
