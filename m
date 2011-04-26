Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:41516 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752047Ab1DZU2X (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 16:28:23 -0400
MIME-Version: 1.0
In-Reply-To: <4DB72810.60601@suse.cz>
References: <4DB4832E.6080009@verizon.net>
	<BANLkTikbo2tqcvAZ5_druZR+fYhBozakew@mail.gmail.com>
	<4DB72810.60601@suse.cz>
Date: Tue, 26 Apr 2011 16:28:23 -0400
Message-ID: <BANLkTim=VMRwaLtcZDxOORdUvxUSOWNYyg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow headerdep to work in KBUILD_OUTPUT and add
 targets to PHONY
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: pefoley2@verizon.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hi,

On Tue, Apr 26, 2011 at 4:16 PM, Michal Marek <mmarek@suse.cz> wrote:
> On 26.4.2011 08:52, Arnaud Lacombe wrote:
>> Hi,
>>
>> On Sun, Apr 24, 2011 at 4:08 PM, Peter Foley <pefoley2@verizon.net> wrote:
>>> This patch fixes the headerdep target so it will work when make is executed from KBUILD_OUTPUT.
>>> It also adds a few targets to PHONY so they are always executed.
>>>
>> one change, one patch, please.
>>
>> Why do you want that much consistency check to be always ran ?
>> Especially `coccicheck', which rely on a non-common program being
>> available.
>
> The change is valid, but the changelog text is misleading. 'PHONY +=
> foo' means that 'make foo' will always execute the commands for foo,
> even if there is a file of the same name.
>
my bad, I just confirmed that purpose by checking make doc :)

 - Arnaud

> Michal
>
