Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:34126 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932526Ab0LTPXX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Dec 2010 10:23:23 -0500
Received: by iwn9 with SMTP id 9so3230018iwn.19
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Dec 2010 07:23:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4D0F68EF.8080801@suse.cz>
References: <1291596649.8025.104.camel@localhost>
	<4D0F68EF.8080801@suse.cz>
Date: Mon, 20 Dec 2010 10:23:22 -0500
Message-ID: <AANLkTikwdbWJ94LkCHTkFhDG6Z_sZ7ijNBb_SAWwjBLD@mail.gmail.com>
Subject: Re: [PATCHv3] Kbuild: kconfig: Verbose version of --listnewconfig
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Ben Hutchings <ben@decadent.org.uk>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

Hi,

On Mon, Dec 20, 2010 at 9:32 AM, Michal Marek <mmarek@suse.cz> wrote:
> On 6.12.2010 01:50, Ben Hutchings wrote:
>> If the KCONFIG_VERBOSE environment variable is set, show the default
>> values of new symbols and not just their names.
>>
>> Based on work by Bastian Blank <waldi@debian.org> and
>> maximilian attems <max@stro.at>.  Simplified by Michal Marek
>> <mmarek@suse.cz>.
>>
>> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
>> ---
>> I believe this incorporates all the comments made on v2.
>
> Thanks, applied to kbuild-2.6.git#kconfig.
>
Did you look at the factorization and abstraction of I proposed ?

 - Arnaud
