Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:34358 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755146AbcBINjo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Feb 2016 08:39:44 -0500
Subject: Re: [PATCH 6/6] kconfig option for TRIM_UNUSED_EXPSYMS
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
 <1454963315-20468-7-git-send-email-nicolas.pitre@linaro.org>
 <20160209132840.GA7303@infradead.org>
From: "Austin S. Hemmelgarn" <ahferroin7@gmail.com>
Message-ID: <56B9EBAE.4020804@gmail.com>
Date: Tue, 9 Feb 2016 08:37:50 -0500
MIME-Version: 1.0
In-Reply-To: <20160209132840.GA7303@infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>, Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

On 2016-02-09 08:28, Christoph Hellwig wrote:
> On Mon, Feb 08, 2016 at 03:28:35PM -0500, Nicolas Pitre wrote:
>> The config option to enable it all.
>
> Just enable it by default..
>
I doubt we care too much about third party modules, but enabling this by 
default will likely cause at least some of them to stop working.  At the 
very least, we need the config option, even if it's enabled by default.
