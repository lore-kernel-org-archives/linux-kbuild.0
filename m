Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:51386 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755010Ab3HBJAK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Aug 2013 05:00:10 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: kconfig/menu.c: Fixup to "kconfig: fix undesirable side effect of adding "visible" menu attribute" ?
In-Reply-To: <CA+icZUWazFoi+B0_p-AjRtcQRJjBmk3gTEZbnBc3o=yPp=ctBw@mail.gmail.com>
	(Sedat Dilek's message of "Fri, 2 Aug 2013 08:11:12 +0200")
References: <CA+icZUVn+a=LSvO9JZXng1E0Ee+4ETk01PPCMRtfV9jqXRXAjw@mail.gmail.com>
	<gir4eeizm9.fsf@karga.hank.lab>
	<CA+icZUXL3trj_Zfisxek8dw4HtNbx2fNDq=Gwn5zKjbNh8GDMg@mail.gmail.com>
	<20130731165340.GA3448@free.fr>
	<CA+icZUUOewVGrAV5EQAsOhmw3kHxcKig2iMpvqJkn9pARkmmcQ@mail.gmail.com>
	<gihafaylql.fsf@karga.hank.lab>
	<CA+icZUWujNLRikqTt4x44d0nZ-9CxeS2G=-AWWaiho8SA=Rw2g@mail.gmail.com>
	<CA+icZUWazFoi+B0_p-AjRtcQRJjBmk3gTEZbnBc3o=yPp=ctBw@mail.gmail.com>
Date: Fri, 02 Aug 2013 10:59:45 +0200
Message-ID: <gibo5geada.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Jan Beulich <JBeulich@novell.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Sedat Dilek <sedat.dilek@gmail.com> writes:

> On Thu, Aug 1, 2013 at 9:17 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> On Thu, Aug 1, 2013 at 8:21 AM, Dirk Gouders <dirk@gouders.net> wrote:
>>> Sedat Dilek <sedat.dilek@gmail.com> writes:
>>>
>>>> On Wed, Jul 31, 2013 at 6:53 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>>> Sedat, Dirk, All,
>>>>>
>>>>> On 2013-07-31 16:22 +0200, Sedat Dilek spake thusly:
>>>>>> On Wed, Jul 31, 2013 at 4:16 PM, Dirk Gouders <dirk@gouders.net> wrote:
>>>>>> > Sedat Dilek <sedat.dilek@gmail.com> writes:
>>>>>> >> The Freetz router project has 370 [1] as a revert-patch of [2] to its
>>>>>> >> kconfig-v3.8.
>>>>>> >>
>>>>>> >> commit 7ad1227818f09242cfe9bf1845fd24211f5f99bd
>>>>>> >> "kconfig: fix undesirable side effect of adding "visible" menu attribute"
>>>>>> >>
>>>>>> >> I am not a kconfig-expert, but [3] looks like a fixup/folowup to it.
>>>>>> >>
>>>>>> >> commit/?id=e983b7b17ad1a978e954e6aaa62cf12bfc747883
>>>>>> >> "kconfig/menu.c: fix multiple references to expressions in menu_add_prop()"
>>>>>> >>
>>>>>> >> I contacted Yann in private, but I think this is worth to ask on the
>>>>>> >> linux-kbuild ML.
>>>>>
>>>>> Yes, there was no reason to write such a question in private.
>>>>>
>>>>>> > you are right, [3] fixes a problem that was introduced by [2].
>>>>>> > (I should have noted that in the commit message -- I'm not sure if we
>>>>>> > can fix that afterwards.)
>>>>>
>>>>> No, it's been pushed to a public tree, it's too late.
>>>>> It's even in Linus' tree, so it is really too late!
>>>>>
>>>>>> thanks for the clarification and fixing this up.
>>>>>> I told Yann in my private email to always add a reference to the
>>>>>> "culprit" commit (root-cause).
>>>>>
>>>>> Since I was not the author of that patch, I have no way to know if it is
>>>>> "a fix for a previous commit", or "just a fix", if the original author
>>>>> does not provide this information.
>>>>>
>>>>> Except for the patches I write, I "just" collect (and test/review) the
>>>>> patches to kconfig in my tree, to make it a bit easier for Michal. I
>>>>> just pass the patches' commit logs as-is (or do trivial edits if
>>>>> needed), so what gets in the tree is the responsibility of the author.
>>>>> Hey, Dirk! ;-)
>>>>>
>>>>> But on the principle, I do agree: if the patch fixes a regression
>>>>> introduced by a previous changeset, it should be referenced in the
>>>>> commit log of that new patch, indeed.
>>>>>
>>>>
>>>> Next time we all do it better before!
>>>> If you fail, you'll get no chocolate,
>>>>
>>>> Good news:
>>>> The Freetz router project accepted my kconfig-v3.11-rc3 version-bump
>>>> [1] and got rid of two patches.
>>>>
>>>> Again, thanks to all involved people.
>>>>
>>>> - Sedat -
>>>>
>>>> [1] http://freetz.org/changeset/10915/trunk
>>>
>>> Hi Sedat,
>>>
>>> I tried to see if I can find some more detail about the Freetz revert
>>> patch [1] -- mainly, because I was wondering if the Freetz people hit
>>> the same problem that [3] fixes.
>>>
>>> Do you have detailed information about the origins of [1], maybe a
>>> pointer to some discussion?  All that I could find so far is
>>> http://freetz.org/ticket/1982#comment:7 but I have to confess that I
>>> don't know the Project and it's documentation style very well.
>>>
>>
>> Hi Dirk,
>>
>> I have put a comment into Freetz ticket #1982.
>>
>
> Hi Dirk,
>
> there seems to be still an issue with Jan's original patch.
> Mostly, Freetz developers test in "expert-mode", but "beginners" and
> "advanced" see [1].
> The known as 370 patch was re-added in [2].

Hi Sedat,

I don't know about those modes but the reason for my original question
was that my commit fixes a problem that appeares in rather uncommon
cases of Kconfig files (I constructed such a case myself) and I was
wondering if (and then why/how) the Freetz project constructed such a
case.

> Sorry, even it's in German, I did not understand the explanation of
> cuma in [3], did you (use a translator)?

I am German and understand the language without any translator ;-)

I am not sure if I interpreted everything correctly, but I read the
comments stating the Freetz project is having two problems when Jan's
original patch isn't reverted:

1) They get an error message
   "make/libs/libstdcxx/libstdc++.mk:1: *** Undefined version for PKG_INIT in make/libs/libstdcxx/libstdc++.mk."
   and state that it disappears when Jan's Patch is reverted.  They call
   that message a side-effect.

2) cuma says that they select symbols that are invisible to the user
   and those symbols get not saved to file with Jan's patch active.

   (Actually, he uses the term "things" and not symbols and says "it
    doesn't help if those aren't saved")

Well, I don't know why the Freetz people prefer to simply revert a patch
instead of trying to investigate the problem in more detail and give
valuable feedback to us but it seems as if my commit has nothing to do
with the problems the Freetz project is having when not reverting Jan's
patch.

> This issue should be tracked.
> I am willing to help.

One non-technical remark: I am quite unconfortable with the way I got
drawn into the "discussion" on freetz.org -- especially, because I
prefer to maintain a respectful discussion style that is focussed on
technical problems.  (Probably, I sometimes appear to break my own rule
but hopefully others notice that English isn't my mother tongue and am
just incorrectly using a foreign language.)

My feeling is that besides a technical problem with a patch there is
an unresolved conflict that I have nothing to do with and don't want to
be drawn into.

Best regards,

Dirk

> Regards,
> - Sedat -
>
> [1] http://freetz.org/ticket/2154#comment:7
> [2] http://freetz.org/changeset/10926
> [3] http://freetz.org/ticket/1982#comment:37
>
>> Regards,
>> - Sedat -
>>
>> [1] http://freetz.org/ticket/1982#comment:36
>>
>>> Dirk
>>>
>>> [1] http://freetz.org/browser/trunk/tools/make/patches/370-save-hidden-prompts-to-file.kconfig.patch
>>> [2] kconfig: fix undesirable side effect of adding "visible" menu attribute
>>> [3] kconfig/menu.c: fix multiple references to expressions in menu_add_prop()
