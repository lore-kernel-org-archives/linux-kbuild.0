Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:43743 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757355AbZLNOTe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Dec 2009 09:19:34 -0500
Message-ID: <4B264974.7050108@suse.cz>
Date: Mon, 14 Dec 2009 15:19:32 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] wrap long help lines
References: <3b09bd800912110901t106bb3a6td581537e151d5ce0@mail.gmail.com> 	<4B237E3C.2080603@suse.cz> <3b09bd800912121959r2f6dba7dt9d62b5af74123deb@mail.gmail.com>
In-Reply-To: <3b09bd800912121959r2f6dba7dt9d62b5af74123deb@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?IlZhZGltIEJlbmRlYnVyeSAo0LLQsSki?= <vbendeb@google.com>
Cc: linux-kbuild@vger.kernel.org

On 13.12.2009 04:59, Vadim Bendebury (вб) wrote:
> 2009/12/12 Michal Marek <mmarek@suse.cz>:
>>> What do you think of mconf:show_help() before invoking
>>> show_help_text() - is it the right spot to plug this in? Do you have a
>>> suggestion?>
>>
>> If you look at the expr_print() prototype, it takes a pointer to a
>> callback and a data argument. This callback gets repeatedly called to
>> store or display parts of the text. So you could create a new callback
>> that pastes the parts together and inserts a newline if needed. That
>> way, you don't have to memcpy() the text around afterwards.
>>
> 
> expr_print() gets  called through expr_gstr_print() from three
> different places in menu.c, how would I limit the scope of this change
> to the case of help message display only? I think this change should
> only affect help messages - don't you agree?

AFAICS all three are called from within menu_get_ext_help() only.

Michal
