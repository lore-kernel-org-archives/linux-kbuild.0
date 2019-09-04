Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39113 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbfIDMMs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 08:12:48 -0400
Subject: Re: [PATCH v4 12/12] RFC: watchdog: export core symbols in
 WATCHDOG_CORE namespace
References: <20180716122125.175792-1-maco@android.com>
 <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com>
 <20190903161045.GA22754@roeck-us.net>
 <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net>
Date: Wed, 4 Sep 2019 05:12:43 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Matthias Maennich <maennich@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Cc: Android Kernel" <kernel-team@android.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, maco@android.com, sspatil@google.com, Will Deacon <will@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-modules@vger.kernel.org, linux-usb <linux-usb@vger.kernel.org>, usb-storage@lists.one-eyed-alien.net, linux-watchdog@vger.kernel.org

On 9/4/19 1:45 AM, Masahiro Yamada wrote:
> On Wed, Sep 4, 2019 at 1:10 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Tue, Sep 03, 2019 at 04:06:38PM +0100, Matthias Maennich wrote:
>>> Modules using symbols from the WATCHDOG_CORE namespace are required to
>>> explicitly import the namespace. This patch was generated with the
>>> following steps and serves as a reference to use the symbol namespace
>>> feature:
>>>
>>>   1) Use EXPORT_SYMBOL_NS* macros instead of EXPORT_SYMBOL* for symbols
>>>      in watchdog_core.c
>>>   2) make  (see warnings during modpost about missing imports)
>>>   3) make nsdeps
>>>
>>> I used 'allmodconfig' for the above steps to ensure all occurrences are
>>> patched.
>>>
>>> Defining DEFAULT_SYMBOL_NAMESPACE in the Makefile is not trivial in this
>>> case as not only watchdog_core is defined in drivers/watchdog/Makefile.
>>> Hence this patch uses the variant of using the EXPORT_SYMBOL_NS* macros
>>> to export into a different namespace.
>>>
>>> An alternative to this patch would be a single definition line before
>>> any use of EXPORT_SYMBOL*:
>>>   #define DEFAULT_SYMBOL_NAMESPACE WATCHDOG_CORE
>>>
>>> This patch serves as a reference on how to use the symbol namespaces.
>>>
>>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Signed-off-by: Matthias Maennich <maennich@google.com>
>>
>> As mentioned before, I am opposed to this set of changes. I don't see
>> the point of restricting the use of exported symbols in WATCHDOG_CORE.
>>
>> Guenter
> 
> 
> I agree.
> 
> I do not like this patch set either.
> 

Note that I don't object to the patch set in general. There may be symbols
which only need be exported in the context of a single subsystem or even
driver (if a driver consists of more than one module). For example, a mfd
driver may export symbols which should only be called by its client drivers.
In such a situation, it may well be beneficial to limit the use of exported
symbols.

I am not sure what good that does in practice (if I understand correctly,
a driver only has to declare that it wants to use a restricted use symbol
if it wants to use it), but that is a different question.

Guenter
