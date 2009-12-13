Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.45.13]:40971 "HELO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750751AbZLMD7p (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Dec 2009 22:59:45 -0500
Received: from wpaz33.hot.corp.google.com (wpaz33.hot.corp.google.com [172.24.198.97])
	by smtp-out.google.com with ESMTP id nBD3xh3x002356
	for <linux-kbuild@vger.kernel.org>; Sat, 12 Dec 2009 19:59:43 -0800
Received: from qyk8 (qyk8.prod.google.com [10.241.83.136])
	by wpaz33.hot.corp.google.com with ESMTP id nBD3xeIw013377
	for <linux-kbuild@vger.kernel.org>; Sat, 12 Dec 2009 19:59:40 -0800
Received: by qyk8 with SMTP id 8so1042508qyk.24
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Dec 2009 19:59:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B237E3C.2080603@suse.cz>
References: <3b09bd800912110901t106bb3a6td581537e151d5ce0@mail.gmail.com>
	<4B237E3C.2080603@suse.cz>
From: =?UTF-8?B?VmFkaW0gQmVuZGVidXJ5ICjQstCxKQ==?= <vbendeb@google.com>
Date: Sat, 12 Dec 2009 19:59:20 -0800
Message-ID: <3b09bd800912121959r2f6dba7dt9d62b5af74123deb@mail.gmail.com>
Subject: Re: [PATCH] wrap long help lines
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

2009/12/12 Michal Marek <mmarek@suse.cz>:
>> What do you think of mconf:show_help() before invoking
>> show_help_text() - is it the right spot to plug this in? Do you have a
>> suggestion?>
>
> If you look at the expr_print() prototype, it takes a pointer to a
> callback and a data argument. This callback gets repeatedly called to
> store or display parts of the text. So you could create a new callback
> that pastes the parts together and inserts a newline if needed. That
> way, you don't have to memcpy() the text around afterwards.
>

expr_print() gets  called through expr_gstr_print() from three
different places in menu.c, how would I limit the scope of this change
to the case of help message display only? I think this change should
only affect help messages - don't you agree?

cheers,
/vb
