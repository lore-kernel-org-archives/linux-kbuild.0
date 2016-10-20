Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:61595 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755850AbcJTHiY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Oct 2016 03:38:24 -0400
Subject: Re: Challenges around the usage of different "HOSTCFLAGS" for kernel
 build configuration and module generation
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
 <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com>
 <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net>
 <CA+r1ZhhqEBvV0ivz=MvaHhRquhFS2mxddJ-GOx81ZeSerKsD3g@mail.gmail.com>
 <ec3a7283-3c41-9879-49ae-8924b8daf65f@users.sourceforge.net>
 <CA+r1Zhj3AQAbL_Hu4w=gX8kaR0zKoYhTmAYyVcvBMPLXpfZ3gA@mail.gmail.com>
 <4fe8b518-6145-5322-a852-beeb61abd559@users.sourceforge.net>
 <CA+r1Zhiat4d8FqFcD1BBCxe5jyWOtSDZp99_CLV0qE1D3REquw@mail.gmail.com>
 <20161019220346.GA20054@gate.crashing.org>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <80d31faa-b328-b8eb-4d19-d96aef1cc16a@users.sourceforge.net>
Date: Thu, 20 Oct 2016 09:37:34 +0200
MIME-Version: 1.0
In-Reply-To: <20161019220346.GA20054@gate.crashing.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Jim Davis <jim.epost@gmail.com>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Don't forget -r when running objdump on an object file.

Thanks for your reminder.


> But, you want to use  make drivers/md/whatever.s  if you want to see
> the assembler code.

Thanks for your advice!

This is one kind of "generation convenience" I was looking for.

Was my software development attention too limited for another moment
so that I did not directly pick an opportunity up from the description
like "dir/file.[ois]  - Build specified target only"
(by the command "make help") that I can get assembler source files
for Linux modules so easy on demand?

Would you like to point any places out in the make scripts which
show relevant commands for such build targets?


> And that doesn't work for build-time tools,

I got the impression that they can trigger further software development challenges.
Should their source files (and corresponding make parameters) be improved anyhow?


> which I think is what the original discussion was about.

I see a few change possibilities there. Will it be useful to reconsider
the generation parameters for build-time tools in comparison to components
from other Linux software areas?

Will a variable like "EXTRA_CFLAGS" achieve a desired effect at more places?

Regards,
Markus
