Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:61247 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932610Ab1AMJ1m (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Jan 2011 04:27:42 -0500
Received: by bwz15 with SMTP id 15so1334806bwz.19
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jan 2011 01:27:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTinM4WoR=rSUbk4j94U9pqSgJOdB84A+5sfj71dK@mail.gmail.com>
References: <AANLkTi=XeygsSSM8Yx+VaznC0MPfP8Ptw7oN1MHBrH+a@mail.gmail.com>
	<AANLkTinM4WoR=rSUbk4j94U9pqSgJOdB84A+5sfj71dK@mail.gmail.com>
Date: Thu, 13 Jan 2011 10:27:40 +0100
Message-ID: <AANLkTi=NLmekT9SfgiuS2FGnGXNYyXBKZxorobEBLbMh@mail.gmail.com>
Subject: Re: Building an external x86_64 module from an x86 (32-bit) machine?
From: Philippe Auphelle <pauphelle@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Arnaud,

> I suppose that you ensured that your kernel tree when you are building
> for x86-32 has been "prepared" for building for x86-32, and that you
> are using a dedicated x86-64 config and preparation when you try to
> build for x86-64 ?

I do use a dedicated x86_64 config, but I didn't prepare.
That's most likely the clue I was missing.
Since all this stuff happens automagically when kbuilding for the
running kernel, it just becomes tricky when you have to decouple the
steps and understand what really goes on below.

I'll come back with the results if I get through it (or more questions
if I don't ;-) )

Thanks alot! /PhA.
