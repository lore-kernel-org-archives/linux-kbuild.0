Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from p-mail2.rd.francetelecom.com ([195.101.245.16]:39818 "EHLO
	p-mail2.rd.francetelecom.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754540Ab2KMOYl convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Nov 2012 09:24:41 -0500
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/1] Documentation: Fix example directories arch problem
Date: Tue, 13 Nov 2012 15:24:38 +0100
References: <1352814965-28502-1-git-send-email-hc0606@gmail.com> <201211131504.40007.yann.morin.1998@free.fr> <CAKEaXcAjzhzUizXnrYkw_51nDHtap8AiX77FHGttZ=KtXkyUuQ@mail.gmail.com>
In-Reply-To: <CAKEaXcAjzhzUizXnrYkw_51nDHtap8AiX77FHGttZ=KtXkyUuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 8BIT
Message-Id: <201211131524.38502.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?utf-8?q?=E9=9F=A9=E8=AF=9A?= <hc0606@gmail.com>
Cc: mmarek@suse.cz, rob@landley.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, hanc.fnst@cn.fujitsu.com

Han Cheng, All,

On Tuesday 13 November 2012 15:20:23 韩诚 wrote:
> Shall we change the tab to 8 space?

Please, don't top-post.

It's something you configure in your editor, not in the file. The file
already uses tabs, so you just have to tell your editor to use 8 'spaces'
to represent tabs. In vim, you do it thus:
  :set tabstop=8

I'll leave it to you as an exrecise on how to set in your favorite editor.
;-)

> 2012/11/13 Yann E. MORIN <yann.morin.1998@free.fr>:
> > On Tuesday 13 November 2012 14:56:05 hc0606@gmail.com wrote:
> >> The example directories arch is not consistent with the kbuild, fix it.
> >
> > It is if you set your tabstop=8 which is the rule for the Linux kernel.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
