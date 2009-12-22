Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:33190 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751846AbZLVSxE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Dec 2009 13:53:04 -0500
Message-ID: <4B31154C.2010204@zytor.com>
Date: Tue, 22 Dec 2009 10:51:56 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: 2.6.32: x86_32: Destination address is too large.
References: <a4423d670912170536m64e71c81v65b11fded21907fb@mail.gmail.com>
In-Reply-To: <a4423d670912170536m64e71c81v65b11fded21907fb@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, tglx@linutronix.de, mingo@redhat.com, x86@kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On 12/17/2009 05:36 AM, Alexander Beregalov wrote:
> 
> heap is 0x31341b80 here,
> CONFIG_PAGE_OFFSET=0xC0000000
> 
> gcc version 4.4.0 20090514 (Red Hat 4.4.0-6.314103)
> 
> 2.6.27 works fine.

The combination of an ancient distro (CentOS/RHEL 4) and a bzip2
compressed kernel makes me feel reasonably certain that this is yet an
instance of "the bloody shell scripts don't actually generate the proper
length field."

It's a known problem and we're working on it.  In the meantime, select
gzip for the kernel compression.

	-hpa


-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

