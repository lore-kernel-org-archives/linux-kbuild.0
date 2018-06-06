Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:37209 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752026AbeFFXED (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jun 2018 19:04:03 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [RFC 1/1] Emacs-like isearch for mconf.
In-Reply-To: <20180606225259.GY17342@gate.crashing.org> (Segher Boessenkool's
        message of "Wed, 6 Jun 2018 17:52:59 -0500")
References: <20180606215855.12889-1-dirk@gouders.net>
        <20180606225259.GY17342@gate.crashing.org>
Date: Thu, 07 Jun 2018 01:03:56 +0200
Message-ID: <ghvaavv7oj.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Segher Boessenkool <segher@kernel.crashing.org> writes:

> On Wed, Jun 06, 2018 at 11:58:55PM +0200, Dirk Gouders wrote:
>> @@ -332,6 +332,7 @@ int init_dialog(const char *backtitle)
>>  
>>  	keypad(stdscr, TRUE);
>>  	cbreak();
>> +	raw();			/* Enable CTRL-sequences*/
>
> Is that a good idea?  You probably should mention it in the patch
> description, either way.

Thanks for commenting on that.  I planned to explicitely mention it in
0/1 when I coded that function call but forgot it when I finally sent
the mail.

Dirk

>
> Segher
