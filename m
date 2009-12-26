Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:36131 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbZLZFPO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Dec 2009 00:15:14 -0500
Message-ID: <4B359BC0.3080808@zytor.com>
Date: Fri, 25 Dec 2009 21:14:40 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [patch] Makefile: Unexport LANG
References: <20091224111300.GA31932@verge.net.au> <4B359166.3050106@redhat.com>
In-Reply-To: <4B359166.3050106@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masami Hiramatsu <mhiramat@redhat.com>
Cc: Simon Horman <horms@verge.net.au>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@sues.cz>, Roland Dreier <rdreier@cisco.com>, Sam Ravnborg <sam@ravnborg.org>

On 12/25/2009 08:30 PM, Masami Hiramatsu wrote:
>>  
>>  # Avoid funny character set dependencies
>> +unexport LANG
>>  unexport LC_ALL
>>  LC_CTYPE=C
>>  LC_COLLATE=C
> 

At this point, it seems to me that we should just LC_ALL=C and be done
with it (see other thread.)

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

