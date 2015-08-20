Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46164 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751534AbbHTI5f (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 04:57:35 -0400
Subject: Re: how to echo $(KBUILD_CFLAGS)
References: <848BD1798F19584EADB3CD55379CFD64665E4D3B@SHMX01.s3graphics.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <55D5967B.9050806@suse.com>
Date: Thu, 20 Aug 2015 10:57:31 +0200
MIME-Version: 1.0
In-Reply-To: <848BD1798F19584EADB3CD55379CFD64665E4D3B@SHMX01.s3graphics.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: RaphaelWu@viatech.com.cn
Cc: daniel.baluta@intel.com, linux-kbuild@vger.kernel.org, octavian.purdila@intel.com, bogdan.m.davidoaia@intel.com

On 2015-08-20 04:03, RaphaelWu@viatech.com.cn wrote:
> Hi,
>         Recently I wrote a test module, within my module I need remove -pg flag
> which is defined by host Makefile (which enable -pg, ftrace function).
>         I used a trick in my module makefile KBUILD_CFLAGS := $(subst -pg,,$(KBUILD_CFLAGS)),

You are probably looking for CLFAGS_REMOVE_<file.o>.

Michal
