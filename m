Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35373 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751935Ab0EFN5E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 May 2010 09:57:04 -0400
Message-ID: <4BE2CAAE.1020802@suse.cz>
Date: Thu, 06 May 2010 15:57:02 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: One question about top-level Makefile.
References: <u2l34f262ce1005052053z1cfe6d1an6c509e847ba4b40@mail.gmail.com>
In-Reply-To: <u2l34f262ce1005052053z1cfe6d1an6c509e847ba4b40@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: os user <gnusercn@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 6.5.2010 05:53, os user wrote:
> Hi, I have a question about the top-level Makefile
> 
> # The all: target is the default when no target is given on the
> # command line.
> # This allow a user to issue only 'make' to build a kernel including modules
> # Defaults vmlinux but it is usually overridden in the arch makefile
> all: vmlinux
> 
> From the last comment, arch makefile will override vmlinux. It seems
> vmlinux will not be checked by `make'. But from my test, although
> `all:' will be re-defined in arch Makefile (ARM arch), vmlinux will
> still be checked and the commands associated will be executed. Should
> we use another word instead of "overridden"?

"Defaults to vmlinux, but the arch makefile usually adds further targets"?

Michal
