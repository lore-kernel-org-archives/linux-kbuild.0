Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50979 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755338AbZLPMCF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Dec 2009 07:02:05 -0500
Message-ID: <4B28CC39.9010307@suse.cz>
Date: Wed, 16 Dec 2009 13:02:01 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] wrap long help lines, take two
References: <3b09bd800912142246u2d069702n759e165553bddc9f@mail.gmail.com> 	<4B279021.6070508@suse.cz> <3b09bd800912152056g40fab3f9q76aef60ccf525bd0@mail.gmail.com>
In-Reply-To: <3b09bd800912152056g40fab3f9q76aef60ccf525bd0@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?IlZhZGltIEJlbmRlYnVyeSAo0LLQsSki?= <vbendeb@google.com>
Cc: linux-kbuild@vger.kernel.org

On 16.12.2009 05:56, Vadim Bendebury (вб) wrote:
> 2009/12/15 Michal Marek <mmarek@suse.cz>:
>> struct somename {
>>  struct gstr *gstr;
>>  int width;
>>  /* other bookkeeping stuff like last_line_length */
>> }
>>
>> Then expr_gstr_print would just initialize an instance of this structure
>> and pass it to expr_print as the callback argument.
> 
> I first thought about it, but decided against it, because the way it
> is now it is a much more contained change. Yes, recalculating string
> length every time is excessive, but in this particular case it is
> harmless.I am also worried of the string modified elsewhere bypassing
> the print helper function, which would take things out of sync and
> cause corrupted data.

expr_print() only sees a void pointer, so it can't modify any data
hidden behind it. But I don't care, do it as you like, just please move
the ncurses calls to menuconfig.

Michal
