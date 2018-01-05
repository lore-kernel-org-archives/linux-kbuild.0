Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.goneo.de ([85.220.129.30]:60330 "EHLO smtp1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751617AbeAEQQW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jan 2018 11:16:22 -0500
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v3 1/1] runchecks: Generalize make C={1,2} to support
 multiple checkers
From: Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <87vagg8jjw.fsf@intel.com>
Date: Fri, 5 Jan 2018 17:05:57 +0100
Content-Transfer-Encoding: 8BIT
Message-Id: <3713CA61-B267-44FF-BF58-91F13CB4F915@darmarit.de>
References: <cover.5b56d020b8e826a7da33b1823c059acd0c123f8b.1515072782.git-series.knut.omang@oracle.com>
 <5f292b7effba0efcf4855bff83b7b9313ac45895.1515072782.git-series.knut.omang@oracle.com>
 <874lo1aait.fsf@intel.com> <1515096931.31439.647.camel@oracle.com>
 <87vagg8jjw.fsf@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Knut Omang <knut.omang@oracle.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, John Haxby <john.haxby@oracle.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Julia Lawall <Julia.Lawall@lip6.fr>, =?utf-8?Q?H=C3=A5kon_Bugge?= <haakon.bugge@oracle.com>, =?utf-8?Q?=C3=85smund_=C3=98stvold?= <asmund.ostvold@oracle.com>, Matthew Wilcox <willy@infradead.org>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, cocci@systeme.lip6.fr, linux-kbuild@vger.kernel.org


> Am 05.01.2018 um 15:30 schrieb Jani Nikula <jani.nikula@linux.intel.com>:
> 
> On Thu, 04 Jan 2018, Knut Omang <knut.omang@oracle.com> wrote:
>> On Thu, 2018-01-04 at 17:50 +0200, Jani Nikula wrote:

[...]

>> Hmm - I have been burnt by the use of unstable interfaces in Python before,
>> when I needed it to work on a (Linux) system with Python v.2.6.x only
>> - argparse was introduced in v.2.7. and alternative choices are not 
>> at all clear to me, see for instance:
>> 
>>  https://dmerej.info/blog/post/docopt-v-argparse/
>> 
>> If this program was part of a "standalone" python project with a well defined python
>> environment, I would probably have used argparse, which I have used in other projects.
>> 
>> In fact I hesitated even to use python for this, because of fear of versioning issues..
>> When I was tempted anyway, and after looking at the existing examples in scripts/ 
>> ruling out python v.3.x, it felt safer to stay with the bare minimum of module 
>> features for this simple logic.
>> 
>> I do feel confident that the benefits of python for this outweighs the drawbacks
>> compared to my initial shell script implementation, or using perl or even C.
>> 
>> Further advice on this appreciated,
> 
> Again, I can only offer my opinion of requiring Python v2.7 and using
> argparse, but it doesn't carry much weight. Up to the kbuild
> maintainers.

FYI: Py2.6 support has ended and Py2 expected to be end in 2020, the
countdown is running ;)

  https://pythonclock.org/

If you wan't a command-line parser which is "builtin" use argparse,
this is what I do mostly. If you are able to use requirements from
outside use click [1]. For more infos read e.g. [2]. Docopt [3] has
its charm but I would prefer the decorators from click.

[1] http://click.pocoo.org/5/
[2] https://realpython.com/blog/python/comparing-python-command-line-parsing-libraries-argparse-docopt-click/
[3] https://github.com/docopt

-- Markus 