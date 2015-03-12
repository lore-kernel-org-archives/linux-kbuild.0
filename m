Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45370 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751857AbbCLIVS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2015 04:21:18 -0400
Message-ID: <55014B9F.3060602@suse.cz>
Date: Thu, 12 Mar 2015 09:17:35 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Question: "genksyms: Track changes to enum constants" doesn't
 work
References: <54FFC37C.8030505@huawei.com>
In-Reply-To: <54FFC37C.8030505@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: shengyong <shengyong1@huawei.com>
Cc: linux-kbuild@vger.kernel.org, sam@ravnborg.org

Dne 11.3.2015 v 05:24 shengyong napsal(a):
> Hi, Michal Marek
> 
> The commit e37ddb8250 ("genksyms: Track changes to enum constants") helps to changes the
> checksum of export symbol if an enum is changed. I test this agains linux-next, but it
> seems that it does not work well.
> 
> 	#include <linux/module.h>
> 	#include <linux/kernel.h>
> 	#include <linux/init.h>
> 
> 	enum a {
> 		E1,
> 		E2,
> 		E_MAX
> 	};
> 
> 	struct s {
> 		int a[E_MAX];
> 	};

What you are seeing is the effect of commit 2c5925d ("genksyms: Do not
expand internal types"). You need to move the type definitions to a
header for these to be considered by genksyms.

Michal
