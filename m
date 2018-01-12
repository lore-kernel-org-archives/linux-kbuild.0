Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:15111 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965277AbeALWu5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jan 2018 17:50:57 -0500
Subject: Re: [PATCH] Remove silentoldconfig from "make help"; fix
 kconfig/conf's help
References: <20171219012656.23728-1-marc.herbert@intel.com>
 <CAK7LNAR8HedCgZAk1fY9rA8HERh5weQCjWXkP2SXuhzRRWVhVQ@mail.gmail.com>
 <070e7d03-b1a7-430f-709b-bb5fe9e2a0a3@intel.com>
 <CAK7LNASR8Qmo85FGr0wW-4t2_uTmDZVSituLLuRm73_+Qqstmw@mail.gmail.com>
From: Marc Herbert <Marc.Herbert@intel.com>
Message-ID: <f7008e72-e762-a86d-8a39-415eae55dae9@intel.com>
Date: Fri, 12 Jan 2018 14:49:41 -0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNASR8Qmo85FGr0wW-4t2_uTmDZVSituLLuRm73_+Qqstmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Thiago Macieira <thiago.macieira@intel.com>, Josh Triplett <josh@joshtriplett.org>, Guenter Roeck <groeck@google.com>, Wayne Boyer <wayne.boyer@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

Masahiro,

On 09/01/2018 23:17, Masahiro Yamada wrote:

>  >   "(oldconfig used to be more verbose)"

>    The historical background is git.
>    If people are interested in archeology,
>    they would be able to do it by "git log", "git blame", etc.
>    We are generally interested in the current behavior.

I'd like to keep that sentence because it's there to explain the legacy and
confusing "--silentoldconfig" name which unfortunately still sticks out in
the *current* conf.c interface.

+       printf("  --silentoldconfig       Similar to oldconfig but generates configuration in\n"
+              "                          include/{generated/,config/} (oldconfig used to be more verbose)\n");

The purpose of this sentence is to warn people that: "silentoldconfig is
just archeology, so you can safely ignore it" and save them time.

The alternative I considered was to entirely remove "silentconfig" not just
from the Makefile's help but from the conf.c help too.

Thoughts?

-- 
Marc
