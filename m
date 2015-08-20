Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:33848 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751239AbbHTR0o (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 13:26:44 -0400
Date: Thu, 20 Aug 2015 19:19:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: how to echo $(KBUILD_CFLAGS)
Message-ID: <20150820171924.GA2620@ravnborg.org>
References: <848BD1798F19584EADB3CD55379CFD64665E5A2C@SHMX01.s3graphics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <848BD1798F19584EADB3CD55379CFD64665E5A2C@SHMX01.s3graphics.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: RaphaelWu@viatech.com.cn
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org

Hi RaphaelWu

Try this:
 
obj-m += test.o

$(warning Before-KBUILD_CFLAGS=$(KBUILD_CFLAGS))

KBUILD_CFLAGS := $(subst -pg,,$(KBUILD_CFLAGS))

$(warning After-KBUILD_CFLAGS=$(KBUILD_CFLAGS))

	Sam
