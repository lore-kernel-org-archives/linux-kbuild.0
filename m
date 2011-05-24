Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:49164 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753777Ab1EXR7k (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 May 2011 13:59:40 -0400
MIME-Version: 1.0
In-Reply-To: <1306258716.7501.35.camel@hiromu-MacBook>
References: <1306167401.18840.8.camel@hiromu-MacBook>
	<BANLkTikhFdd_PRzCg3w9HD1TO=cmdmm6_A@mail.gmail.com>
	<1306242400.7501.10.camel@hiromu-MacBook>
	<4DDBB150.2090602@suse.cz>
	<1306247192.7501.25.camel@hiromu-MacBook>
	<4DDBC846.8050402@suse.cz>
	<BANLkTin5ZDt5ZeckOJ2WsNUZm6mxmYiRwQ@mail.gmail.com>
	<1306258716.7501.35.camel@hiromu-MacBook>
Date: Tue, 24 May 2011 13:59:39 -0400
Message-ID: <BANLkTikFT17GOgV1UJTFxEG+P2X-u4ZJjw@mail.gmail.com>
Subject: Re: [PATCH] Kconfig: add warning about permission of config file
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Hiromu Yakura <hiromu1996@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, zippel@linux-m68k.org

Hi,

On Tue, May 24, 2011 at 1:38 PM, Hiromu Yakura <hiromu1996@gmail.com> wrote:
> On Tue, May 24, 2011, at 0:50, Arnaud Lacombe <lacombar@gmail.com>
> wrote:
>> On Tue, May 24, 2011 at 11:01 AM, Michal Marek <mmarek@suse.cz> wrote:
>> > I see, qconf lacks a check for the return value of conf_write() in
>> > ConfigMainWindow::closeEvent(), gconf does check the return value, but only
>> > displays it in the bottom box of the main window instead of a message box.
>> > Neither of them return failure in the error case. These bugs should be
>> > indeed fixed.
>> >
>> agree.
>>
>> > But I don't like the directory permission check, it only
>> > handles one case, but does not handle permission on the .config file itself
>> > with KCONFIG_OVERWRITECONFIG=1, ENOSPC and so on.
>> >
>> seconded.
> I'm sorry for forgetting to handle a case which was set KCONFIG_OVERWRITECONFIG.
> So I rewrote the patch and attach it.
>
> Thanks for your advice.
>
> Signed-off-by: Hiromu Yakura <hiromu1996@gmail.com>
>
Let me re-state: your patch does not handle all the case where
conf_write() may fails, and I do not think we want to preemptively
check for all errors open(2) may return.

 - Arnaud
