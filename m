Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4D01149A020000780002705C@vpn.id2.novell.com>
Date: Thu, 09 Dec 2010 16:40:42 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: Re: [PATCH] fix undesirable side effect of adding "visible"
	 menu attribute
References: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
 <AANLkTikrnC4mbFN31Ct90St7f7Hv0a0Z4TR6qPs+4w-t@mail.gmail.com>
 <AANLkTi=vnF-3JoBN+PYGXAXN2SDBocbLUQMRV2kPNo5U@mail.gmail.com>
In-Reply-To: <AANLkTi=vnF-3JoBN+PYGXAXN2SDBocbLUQMRV2kPNo5U@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: mchehab@redhat.com, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

>>> On 09.12.10 at 17:07, Arnaud Lacombe <lacombar@gmail.com> wrote:
> On Thu, Dec 9, 2010 at 10:58 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> [..]
>> I'm not either a big fan of testing `menu->visibility' truth, it is an
>> expression which should be expended by the proper expr_* accessor to
>> have less things to fix later.
>>
> gniarf, forget about that paragraph, I'm not fully awaken :/
> 
> What I thought about was the case where the visible property would
> explicitly default to 'y' in which case the expression will have to be
> simplified/manipulated, in that case, menu_finalize() will be the
> place to do that, so this come back to my first comment.

I'm not sure in menu_finalize() you can properly/easily deal with
multiple prompts associated with the same symbol under different
menus.

Anyway, the patch I proposed works (for me), and I'm hoping
to get it in unless someone (you?) comes up with a better one.
Not fixing the (presumably unintended) side effect of your
earlier patch seems undesirable to me.

Jan

