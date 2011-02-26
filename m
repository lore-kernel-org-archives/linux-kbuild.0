Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:62411 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751409Ab1BZX0X (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Feb 2011 18:26:23 -0500
MIME-Version: 1.0
In-Reply-To: <AANLkTik0VoCSHbpZ=CqG8ZoBNKVQuOEKf3bf19uz-tjj@mail.gmail.com>
References: <4D671556.80607@suse.com>
	<20110225060706.GA12723@merkur.ravnborg.org>
	<AANLkTimFd+KFKgiOF8iVoM8Pk77Zy+5CsFs5BCYqCw=L@mail.gmail.com>
	<AANLkTimTm40Sp5-kMaL4d1oXf3CzytZsBCus3DN0jwD-@mail.gmail.com>
	<AANLkTi=bJRh=0N6wP3LJWTQHSXsX4xdE7oOzK0CFcTfc@mail.gmail.com>
	<AANLkTik0VoCSHbpZ=CqG8ZoBNKVQuOEKf3bf19uz-tjj@mail.gmail.com>
Date: Sat, 26 Feb 2011 18:26:22 -0500
Message-ID: <AANLkTi=+PD9jTMJ+MsB0S+ESmN97O69HosbuVB7fgaQN@mail.gmail.com>
Subject: Re: [PATCH] Add ``cloneconfig'' target
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Jeff Mahoney <jeffm@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

Hi,

On Sat, Feb 26, 2011 at 6:16 PM, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Sat, Feb 26, 2011 at 11:57 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
>> On Sat, Feb 26, 2011 at 5:47 PM, Miguel Ojeda
>> <miguel.ojeda.sandonis@gmail.com> wrote:
>>> /proc/config.gz is provided by the kernel and its format is defined by
>>> kconfig itself which is, as well, part of the kernel (it is not one
>>> random format from a pool of a trillion), so it will be nice if
>>> kconfig learns how to read its own configuration from there.
>>>
>> your point being ? kconfig is not only used by the Linux kernel, and
>> you cannot expect the feature to only be used in the cozy Linux kernel
>> environment.
>
> My point was that supporting reading from a .gz file is not anywhere
> near "knowing about the trillion file format which exist in the world"
>
Well, Jeff's patch is already about gzip and bzip2. Soon it will be
compress, xz, zip, rar, then rzip, lzma, 7z ...

 - Arnaud
