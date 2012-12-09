Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41425 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752007Ab2LIOfy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 9 Dec 2012 09:35:54 -0500
Message-ID: <50C4A1C2.2000709@suse.cz>
Date: Sun, 09 Dec 2012 15:35:46 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Building linux headers in an non-linux environment
References: <50984118.2070204@gmail.com>
In-Reply-To: <50984118.2070204@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard H Lee <ricardohenrylee@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 5.11.2012 23:43, Richard H Lee wrote:
> I'm trying to install linux headers for cygwin using crostool-ng.
> 
> ct-ng basically invokes the line:
> 
> make -C /home/richard/scratch/x86linux/.build/src/linux-3.5
> O=/home/richard/scratch/x86linux/.build/i386-unknown-linux-gnu/build/build-kernel-headers
> ARCH=x86
> INSTALL_HDR_PATH=/home/richard/x-tools/i386-unknown-linux-gnu/i386-unknown-linux-gnu/sysroot/usr
> V=1 headers_install
> 
> and it seems to have checked out v3.5 of the linux kernel.
> 
> The problem is that making the headers seems to require an existing set
> of headers already installed. The required headers seem to be in the
> include/ and arch/[target]/ directories.

Can you be more specific? What error messages are you getting? make
headers_install needs to compile scripts/unifdef.c, but this is not
linux specific.

Michal
