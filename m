Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4D010D130200007800027016@vpn.id2.novell.com>
Date: Thu, 09 Dec 2010 16:08:35 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: Re: [PATCH] fix undesirable side effect of adding "visible"
	 menu attribute
References: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
 <AANLkTikrnC4mbFN31Ct90St7f7Hv0a0Z4TR6qPs+4w-t@mail.gmail.com>
In-Reply-To: <AANLkTikrnC4mbFN31Ct90St7f7Hv0a0Z4TR6qPs+4w-t@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: mchehab@redhat.com, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

>>> On 09.12.10 at 16:58, Arnaud Lacombe <lacombar@gmail.com> wrote:
> On Thu, Dec 9, 2010 at 3:11 AM, Jan Beulich <JBeulich@novell.com> wrote:
>> --- 2.6.37-rc5/scripts/kconfig/menu.c
>> +++ 2.6.37-rc5-kconfig-propagate-visibility/scripts/kconfig/menu.c
>> @@ -140,6 +140,20 @@ struct property *menu_add_prop(enum prop
>>                }
>>                if (current_entry->prompt && current_entry != &rootmenu)
>>                        prop_warn(prop, "prompt redefined");
>> +
>> +               /* Apply all upper menus' visibilities to actual prompts. */
>> +               if(type == P_PROMPT) {
>> +                       struct menu *menu = current_entry;
>> +
>> +                       while ((menu = menu->parent) != NULL) {
>> +                               if (!menu->visibility)
>> +                                       continue;
>> +                               prop->visible.expr
>> +                                       = expr_alloc_and(prop->visible.expr,
>> +                                                        menu->visibility);
>> +                       }
>> +               }
>> +
> Shouldn't this better to be done in menu_finalize() ?

I don't know, I just looked for a place where I could get it done
in a reasonably simple way.

> I'm not either a big fan of testing `menu->visibility' truth, it is an
> expression which should be expended by the proper expr_* accessor to
> have less things to fix later.

Not sure what you're telling me here? What accessor?

Jan

