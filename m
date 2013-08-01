Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:36773 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751663Ab3HAHBQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 Aug 2013 03:01:16 -0400
Received: by mail-wi0-f180.google.com with SMTP id f14so1462638wiw.1
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Aug 2013 00:01:15 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <CA+icZUVpVbHmT+Z4JmzqfjMU2JF5WpjzY5h4ODS1L-UxDgtnGQ@mail.gmail.com>
References: <CA+icZUVn+a=LSvO9JZXng1E0Ee+4ETk01PPCMRtfV9jqXRXAjw@mail.gmail.com>
	<gir4eeizm9.fsf@karga.hank.lab>
	<CA+icZUXL3trj_Zfisxek8dw4HtNbx2fNDq=Gwn5zKjbNh8GDMg@mail.gmail.com>
	<20130731165340.GA3448@free.fr>
	<CA+icZUUOewVGrAV5EQAsOhmw3kHxcKig2iMpvqJkn9pARkmmcQ@mail.gmail.com>
	<gihafaylql.fsf@karga.hank.lab>
	<CA+icZUVpVbHmT+Z4JmzqfjMU2JF5WpjzY5h4ODS1L-UxDgtnGQ@mail.gmail.com>
Date: Thu, 1 Aug 2013 09:01:15 +0200
Message-ID: <CA+icZUWSrA4rfK9OgW7vwgqKhRNpthQ+UnvULeOO9ozuuWxiSg@mail.gmail.com>
Subject: Re: kconfig/menu.c: Fixup to "kconfig: fix undesirable side effect of
 adding "visible" menu attribute" ?
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Jan Beulich <JBeulich@novell.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Thu, Aug 1, 2013 at 8:51 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Thu, Aug 1, 2013 at 8:21 AM, Dirk Gouders <dirk@gouders.net> wrote:
>> Sedat Dilek <sedat.dilek@gmail.com> writes:
>>
>>> On Wed, Jul 31, 2013 at 6:53 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>> Sedat, Dirk, All,
>>>>
>>>> On 2013-07-31 16:22 +0200, Sedat Dilek spake thusly:
>>>>> On Wed, Jul 31, 2013 at 4:16 PM, Dirk Gouders <dirk@gouders.net> wrote:
>>>>> > Sedat Dilek <sedat.dilek@gmail.com> writes:
>>>>> >> The Freetz router project has 370 [1] as a revert-patch of [2] to its
>>>>> >> kconfig-v3.8.
>>>>> >>
>>>>> >> commit 7ad1227818f09242cfe9bf1845fd24211f5f99bd
>>>>> >> "kconfig: fix undesirable side effect of adding "visible" menu attribute"
>>>>> >>
>>>>> >> I am not a kconfig-expert, but [3] looks like a fixup/folowup to it.
>>>>> >>
>>>>> >> commit/?id=e983b7b17ad1a978e954e6aaa62cf12bfc747883
>>>>> >> "kconfig/menu.c: fix multiple references to expressions in menu_add_prop()"
>>>>> >>
>>>>> >> I contacted Yann in private, but I think this is worth to ask on the
>>>>> >> linux-kbuild ML.
>>>>
>>>> Yes, there was no reason to write such a question in private.
>>>>
>>>>> > you are right, [3] fixes a problem that was introduced by [2].
>>>>> > (I should have noted that in the commit message -- I'm not sure if we
>>>>> > can fix that afterwards.)
>>>>
>>>> No, it's been pushed to a public tree, it's too late.
>>>> It's even in Linus' tree, so it is really too late!
>>>>
>>>>> thanks for the clarification and fixing this up.
>>>>> I told Yann in my private email to always add a reference to the
>>>>> "culprit" commit (root-cause).
>>>>
>>>> Since I was not the author of that patch, I have no way to know if it is
>>>> "a fix for a previous commit", or "just a fix", if the original author
>>>> does not provide this information.
>>>>
>>>> Except for the patches I write, I "just" collect (and test/review) the
>>>> patches to kconfig in my tree, to make it a bit easier for Michal. I
>>>> just pass the patches' commit logs as-is (or do trivial edits if
>>>> needed), so what gets in the tree is the responsibility of the author.
>>>> Hey, Dirk! ;-)
>>>>
>>>> But on the principle, I do agree: if the patch fixes a regression
>>>> introduced by a previous changeset, it should be referenced in the
>>>> commit log of that new patch, indeed.
>>>>
>>>
>>> Next time we all do it better before!
>>> If you fail, you'll get no chocolate,
>>>
>>> Good news:
>>> The Freetz router project accepted my kconfig-v3.11-rc3 version-bump
>>> [1] and got rid of two patches.
>>>
>>> Again, thanks to all involved people.
>>>
>>> - Sedat -
>>>
>>> [1] http://freetz.org/changeset/10915/trunk
>>
>> Hi Sedat,
>>
>> I tried to see if I can find some more detail about the Freetz revert
>> patch [1] -- mainly, because I was wondering if the Freetz people hit
>> the same problem that [3] fixes.
>>
>> Do you have detailed information about the origins of [1], maybe a
>> pointer to some discussion?  All that I could find so far is
>> http://freetz.org/ticket/1982#comment:7 but I have to confess that I
>> don't know the Project and it's documentation style very well.
>>
>
> Short answer: kconfig v3.11-rc3 seems to fix it.
> ( Personally, I did not hit the issue. )
>
> My personal conclusion: The Freetz developers simply don't like or
> care about docs.
>
> For example, I tried to establish a DEP-3 (Debian) based format for
> all the (toolchain) patches...
> But people cannot give you detailed infos, so how to fill in the infos?
> I would have done the job - for no money.
>
> Those people don't like to write detailed changelogs before pushing.
>
> Some of those guys really think the development tree is OK for
> breaking, to say there is no review-process.
>
> Even years ago I had some discussion to switch from SVN to Git.
> As they saw so many packages are maintained in Git repositories, now
> it is realized.
>
> I have so often asked for clarification/explanation.
>
> "Successful projects have a good documentation!"
>
> OMG, I remember words like "The Linux-kernel development with XX years
> of experience... why not do things like...".
> ( /me searches for Aspirin, oxygene-mask, ... )
>
> The Freetz router project is a small Linux embedded project.
> With "their style" they won't attract and/or hold (new) developers.
>
> If you like I can forward your question to the responsibles if you like?
> I cannot promise you will get an answer.
>
> - Sedat -
>
> P.S.: Yes, I was a Freetz developer. Yes, I left the project.
> Note2myself: Buy a new cheap router and switch to OpenWrt.
>

I forget to point to Peter Hutterer's nice blog-article "On commit messages".

I encourage all developers to read and (try to) follow (all) his advices.

- Sedat -

[1] http://who-t.blogspot.de/2009/12/on-commit-messages.html

>> Dirk
>>
>> [1] http://freetz.org/browser/trunk/tools/make/patches/370-save-hidden-prompts-to-file.kconfig.patch
>> [2] kconfig: fix undesirable side effect of adding "visible" menu attribute
>> [3] kconfig/menu.c: fix multiple references to expressions in menu_add_prop()
