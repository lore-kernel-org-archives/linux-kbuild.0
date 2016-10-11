Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57741 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753880AbcJKXPn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Oct 2016 19:15:43 -0400
Subject: Re: please, where has xconfig KConf option documentation gone with
 linux 4.8's Qt5 / Qt4 xconfig ?
References: <CALyZvKyveULRX56yZz1nx96ZjDoo3JKPAFqj=29p++nx=sGHVw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3077d5cb-9a8a-5d3e-cd00-ce3ad5cb3406@infradead.org>
Date: Tue, 11 Oct 2016 16:15:40 -0700
MIME-Version: 1.0
In-Reply-To: <CALyZvKyveULRX56yZz1nx96ZjDoo3JKPAFqj=29p++nx=sGHVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Vas Dias <jason.vas.dias@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

[changed linux-config to linux-kbuild list]

On 10/09/16 13:46, Jason Vas Dias wrote:
> Hi -
> I've been doing 'make xconfig'  to configure the kernel for many years now, and
> always there used to be some option documentation pane populated with
> summary documentation for the specific option selected .
> But now,  when built for Qt 5.7.0, (also tried Qt 4.8 and GTK) there
> is no option
> documentation pane - this is a real pain !  The option documentation also
> is not displayed with any other gui, eg.  'make menuconfig' / 'make gtkconfig' -
> I'm sure it used to be . This is a regression IMHO .
> How can I restore display of documentation for each selected option ?
> Will older xconfig work for Linux 4.8 ? it appears not ...
> Thanks in advance for any replies,
> Jason

That's odd. I see the help info in all of xconfig, gconfig, menuconfig, & nconfig.

In xconfig, if the right hand side of the config window only lists some kernel config
options and no symbol help/info, the symbol info portion may be hidden. Try pointing
to the bottom of the right side of the window and hold down the left mouse button
and then drag the mouse pointer upward to open the symbol info pane.
At least that is what works for me.

-- 
~Randy
